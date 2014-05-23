class Pool < ActiveRecord::Base
  ### relations
  has_and_belongs_to_many :matches
  has_many :bets
  has_many :answers
  has_many :registrations
  has_many :users, through: :bets
  ### validations
  validates_presence_of :name, :end_date, :price
  ### scopes
  scope :active, -> { where(completed: false) }
  scope :inactive, -> { where(completed: true) }

  def uniq_users
    users.distinct
  end

  def pot_size
    (uniq_users.count) * price
  end

  def users_classification
    classification = {}
    uniq_users.each do |user|
      classification[user.name] = user.total_points_in_pool(self)
    end
    classification.sort_by{|k,v| v}.reverse.to_h
  end

end
