class Group < ActiveRecord::Base
  ## relations
  has_many :teams
  has_many :matches
end
