class Bet < ActiveRecord::Base
  ### relations
  belongs_to :user
  belongs_to :pool
  belongs_to :match
  ### validations
  validates_presence_of :local, :visitor, :match_time, on: :update
  ### callbacks
  after_update :mark_as_completed

  ### instance methods
  def to_s
    "#{local} - #{visitor}"
  end

  def match_score
    match.final_score
  end

  def result
    valid? ? check_result : nil
  end

  def calculate_and_set_points
    points = match.played? ? check_points : 0
    update_column(:points, points)
  end

  ### class methods
  def self.create_all_bets_for(user, pool)
    pool.matches.each do |match|
      attributes = {pool: pool, match: match, user: user}
      unless exists?(attributes)
        create(attributes)
      end
    end
  end

  def self.of_pool(pool)
    where(pool: pool)
  end

  def self.of_group(group)
    joins(:match).where('matches.group_id = ?', group.id).order('matches.match_number')
  end

  def self.with_matches_by_date(time)
    joins(:match).where('matches.date = ?', time).order('matches.match_number')
  end

  private
    def mark_as_completed
      update_column(:completed, true)
    end

    def check_result
      if local > visitor
        'local'
      elsif visitor > local
        'visitor'
      elsif local == visitor
        'draw'
      end
    end

    def check_points
      if to_s == match.final_score.to_s
        3
      elsif result == match.final_score.result
        1
      else
        0
      end
    end
end
