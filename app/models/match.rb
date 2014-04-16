class Match < ActiveRecord::Base
  has_many :scores
  validates_presence_of :stadium, :date, :visitor_team_id, :local_team_id

  def visitor
    Team.find(visitor_team_id)
  end

  def local
    Team.find(local_team_id)
  end
end
