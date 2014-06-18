class EliminationMatch < ActiveRecord::Base
  ### accesores
  attr_reader :visitor_team, :local_team
  ### relations
  has_many :elimination_bets
  has_and_belongs_to_many :pools
  ### scopes
  default_scope -> { order([:match_number, :date]) }
  scope :by_date, ->(time) { where(date: time) }
  ### validations
  validates_presence_of :stadium, :date, :hour, :match_number
  ### Callbacks
  after_update :calculate_points_of_bets
  ###instance methods

  def to_s
    if local_team_id.present? && visitor_team_id.present?
      get_teams
      "#{local_name} vs #{visitor_name}"
    else
      "Partido #{match_number}"
    end
  end

  def get_teams
    @teams ||= Team.find([local_team_id, visitor_team_id])
    @teams.each do |team|
      @local_team = team if team.id == local_team_id
      @visitor_team = team if team.id == visitor_team_id
    end
  end

  def local_name
    local_team.name
  end

  def visitor_name
    visitor_team.name
  end

  def score_to_s
    played? ? "#{local} - #{visitor}" : "por jugar"
  end

  def result_to_s
    played? ? check_result : nil
  end

  def played?
    local.present? && visitor.present? && local_team_id.present? && visitor_team_id.present?
  end

  private
    def check_result
      if local > visitor
        local_name
      elsif visitor > local
        visitor_name
      elsif local == visitor
        'draw'
      end
    end

    def calculate_points_of_bets
      elimination_bets.each(&:calculate_and_set_points) if elimination_bets.any?
    end

end
