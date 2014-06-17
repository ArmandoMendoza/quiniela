class EliminationBet < ActiveRecord::Base
  ### relations
  belongs_to :user
  belongs_to :pool
  belongs_to :elimination_match


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

end
