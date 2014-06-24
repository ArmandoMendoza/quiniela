class Pool < ActiveRecord::Base
  ### relations
  has_and_belongs_to_many :matches
  has_and_belongs_to_many :elimination_matches
  has_many :bets, dependent: :delete_all
  has_many :elimination_bets, dependent: :delete_all
  has_many :answers, dependent: :delete_all
  has_many :registrations
  has_many :users, -> { distinct }, through: :bets
  ### validations
  validates_presence_of :name, :end_date, :price, :pot_percentage
  ### scopes
  scope :active, -> { where(completed: false) }
  scope :inactive, -> { where(completed: true) }

  ## instance methods
  def pot_size
    (users.count * price) * (pot_percentage / 100)
  end

  def users_classification
    classification = {}
    users.each do |user|
      classification[user.nickname] = [user.total_points_in_pool(self), user.total_elimination_points_in_pool(self)]
    end
    Hash[classification.sort_by{|k,v| v[0] + v[1]}.reverse]
  end

  ## class methods
    def bets_of_user(user)
      bets.includes(:match).where(user: user)
    end

    def elimination_bets_of_user(user)
      elimination_bets.includes(:elimination_match).where(user: user).
      order("elimination_matches.match_number")
    end

    def self.active_for_user(user)
      array_pool = all.to_a
      user.pools.each do |user_pool|
        array_pool.delete(user_pool)
      end
      array_pool
    end
end
