class Pool < ActiveRecord::Base
  ### relations
  has_and_belongs_to_many :matches
  has_many :bets, dependent: :delete_all
  has_many :answers, dependent: :delete_all
  has_many :registrations
  has_many :users, -> { distinct }, through: :bets
  ### validations
  validates_presence_of :name, :end_date, :price, :pot_percentage
  ### scopes
  scope :active, -> { where(completed: false) }
  scope :inactive, -> { where(completed: true) }

  def pot_size
    (users.count * price) * (pot_percentage / 100)
  end

  def users_classification
    classification = {}
    users.each do |user|
      classification[user.nickname] = user.total_points_in_pool(self)
    end
    Hash[classification.sort_by{|k,v| v}.reverse]
  end

end
