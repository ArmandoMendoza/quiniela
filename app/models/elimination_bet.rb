class EliminationBet < ActiveRecord::Base
  ### relations
  belongs_to :user
  belongs_to :pool
  belongs_to :elimination_match

  ### instance methods
  def to_s
    finished? ? "#{local_name} vs #{visitor_name}" : "sin apostar"
  end

  def score_to_s
    finished?  ? "#{local} - #{visitor}" : "sin apostar"
  end

  def result_to_s
    finished? ? check_result : nil
  end

  def finished?
    local.present? && visitor.present? && local_name.present? && visitor_name.present?
  end

  def calculate_and_set_points
    points = elimination_match.played? ? check_match : 0
    update_column(:points, points)
  end

  ### class methods
  def self.create_all_bets_for(user, pool)
    pool.elimination_matches.each do |match|
      attributes = {pool: pool, elimination_match: match, user: user}
      unless exists?(attributes)
        attributes[:pos] = match.match_number.gsub(/[^\d]/, '').to_i
        create(attributes)
      end
    end
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

    def check_match
      if to_s == elimination_match.to_s
        check_points
      else
        0
      end
    end

    def check_points
      if score_to_s == elimination_match.score_to_s
        5
      elsif result_to_s == elimination_match.result_to_s
        3
      else
        0
      end
    end
end