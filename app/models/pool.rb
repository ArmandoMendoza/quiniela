class Pool < ActiveRecord::Base
  ### relations
  has_and_belongs_to_many :matches
  has_many :bets
  has_many :users, through: :bets
  ### validations
  validates_presence_of :name, :end_date
  ### scopes
  scope :active, -> { where(completed: false) }
  scope :inactive, -> { where(completed: true) }

  def uniq_users
    users.distinct
  end

end
