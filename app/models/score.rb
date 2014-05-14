class Score < ActiveRecord::Base
  ### constants
  MATCH_TIMES = { "Partido" => "full-time", "Prorroga" => "aggregate", "Penales" => "penalties" }
  ### relations
  belongs_to :match
  ### validations
  validates_presence_of :visitor, :local, :match_time
  ### Callbacks
  after_save :check_bets_of_match

  ### instance methods
  def to_s
    "#{local} - #{visitor}"
  end

  def result
    valid? ? check_result : nil
  end

  private
    def check_result
      if local > visitor
        'local'
      elsif visitor > local
        'visitor'
      elsif local == visitor
        'draw'
      end
    end

    def check_bets_of_match
      match.bets.each(&:calculate_and_set_points) if match.bets.any?
    end
end
