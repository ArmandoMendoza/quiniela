module MatchesHelper
  def check_match(match_score)
    match_score.present? ? match_score : "No jugado"
  end
  alias :cm :check_match
end
