class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :pool
  belongs_to :match

  def self.create_all_bets_for(user, pool)
    pool.matches.each do |match|
      create(pool: pool, match: match, user: user)
    end
  end
end
