class Match < ActiveRecord::Base
  has_many :scores

  def visitor
    Team.find(visitor_team_id)
  end

  def local
    Team.find(local_team_id)
  end
end
