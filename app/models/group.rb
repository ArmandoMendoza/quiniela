class Group < ActiveRecord::Base
  ## Structs
  TeamData = Struct.new(:name, :abbr, :matches, :win, :draw, :lose, :goles_favor, :goles_contra, :points)
  ResultData = Struct.new(:abbr, :goals)

  ## relations
  has_many :teams
  has_many :matches

  ## instance methods

  def classification_table
    data_teams = {}
    teams.each do |team|
      data_teams[team.abbr] = TeamData.new(team.name, team.abbr, 0, 0, 0, 0, 0, 0, 0)
    end

    matches.each do |match|
      match.get_teams
      if match.played?
        local = ResultData.new(match.local_team.abbr, match.final_score.local)
        visitor = ResultData.new(match.visitor_team.abbr, match.final_score.visitor)
        calculate_points(data_teams, local, visitor)
      end
    end

    sort_teams(data_teams)
  end

  private

    def calculate_points(data_teams, local, visitor)
      data_local = data_teams[local.abbr]
      data_visitor = data_teams[visitor.abbr]
      if local.goals > visitor.goals
        set_win(data_local, local.goals, visitor.goals)
        set_lose(data_visitor, visitor.goals, local.goals)
      end
      if visitor.goals > local.goals
        set_win(data_visitor, visitor.goals, local.goals)
        set_lose(data_local, local.goals, visitor.goals)
      end
      if local.goals == visitor.goals
        set_draw(data_local, local.goals, visitor.goals)
        set_draw(data_visitor, visitor.goals, local.goals)
      end
    end

    def set_win(data_team, goles_favor, goles_contra)
      data_team.matches = data_team.matches + 1
      data_team.win = data_team.win + 1
      data_team.goles_favor = data_team.goles_favor + goles_favor
      data_team.goles_contra = data_team.goles_contra + goles_contra
      data_team.points = data_team.points + 3
    end

    def set_lose(data_team, goles_favor, goles_contra)
      data_team.matches = data_team.matches + 1
      data_team.lose = data_team.lose + 1
      data_team.goles_favor = data_team.goles_favor + goles_favor
      data_team.goles_contra = data_team.goles_contra + goles_contra
    end

    def set_draw(data_team, goles_favor, goles_contra)
      data_team.matches = data_team.matches + 1
      data_team.draw = data_team.draw + 1
      data_team.goles_favor = data_team.goles_favor + goles_favor
      data_team.goles_contra = data_team.goles_contra + goles_contra
      data_team.points = data_team.points + 1
    end

    def sort_teams(data_teams)
      t = data_teams.sort_by { |abbr, team| [team.points, team.goles_favor] }.reverse
      t.map { |team| team.drop(1) }.flatten
    end
end
