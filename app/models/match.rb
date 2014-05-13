class Match < ActiveRecord::Base
  ### accesores
  attr_reader :visitor_team, :local_team
  ### relations
  has_many :scores
  has_many :bets
  belongs_to :group
  has_and_belongs_to_many :pools
  ### scopes
  default_scope -> { order([:match_number, :date]) }
  scope :by_date, ->(time) { where(date: time) }
  ### validations
  validates_presence_of :stadium, :date, :visitor_team_id, :local_team_id
  validate :check_teams

  ### instance methods
  def to_s
    get_teams
    "#{local_team.name} vs #{visitor_team.name}"
  end

  def get_teams
    teams = Team.find([local_team_id, visitor_team_id])
    teams.each do |team|
      @local_team = team if team.id == local_team_id
      @visitor_team = team if team.id == visitor_team_id
    end
  end

  def final_score
    scores.last
  end

  def visitor
    @visitor_team || Team.find(visitor_team_id)
  end

  def local
    @local_team || Team.find(local_team_id)
  end

  private

    def check_teams
      if local_team_id == visitor_team_id
        errors[:visitor_team_id] = "No puedes elegir dos veces el mismo equipo"
      end
    end
end
