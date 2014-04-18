class Team < ActiveRecord::Base
  ### relations
  belongs_to :group
  ### scopes
  default_scope -> { order(:pos) }
end
