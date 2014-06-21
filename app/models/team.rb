class Team < ActiveRecord::Base
  ### relations
  belongs_to :group
  ### scopes
  default_scope -> { order(:pos) }

  def name_js
    name.parameterize
  end
end
