class Team < ActiveRecord::Base
  belongs_to :group
  default_scope -> { order(:pos) }
end
