class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :pool
  belongs_to :match

  validates_presence_of :local, :visitor, :match_time, on: :update
  after_update :mark_as_completed

  def to_s
    "#{local}-#{visitor}"
  end

  def match_score
    match.final_score
  end

  def result
    valid? ? check_result : nil
  end

  def self.create_all_bets_for(user, pool)
    pool.matches.each do |match|
      attributes = {pool: pool, match: match, user: user}
      unless exists?(attributes)
        create(attributes)
      end
    end
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
end
