class Pool < ActiveRecord::Base
  has_and_belongs_to_many :matches
  has_many :bets

  scope :active, -> { where(completed: false) }
  scope :inactive, -> { where(completed: true) }

end
