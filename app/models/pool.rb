class Pool < ActiveRecord::Base
  has_and_belongs_to_many :matches
  has_many :bets
  validates_presence_of :name, :end_date

  scope :active, -> { where(completed: false) }
  scope :inactive, -> { where(completed: true) }

end
