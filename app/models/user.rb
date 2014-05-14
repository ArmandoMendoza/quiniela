class User < ActiveRecord::Base
  ### thirt party
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  ### relations
  has_many :bets
  ### validations
  validates_presence_of :name, :email

  ### instance methods
  def create_bets_from(pool)
    Bet.create_all_bets_for(self, pool)
  end

  def admin?
    role == "admin"
  end

  def regular?
    role == "regular"
  end

  def total_points_in_pool(pool)
    bets.where(pool_id: pool.id).sum(:points)
  end

  def active_pools
    ##get uniq ids of pool of my bets
    pool_ids = bets.pluck(:pool_id).uniq
    Pool.active.where(id: pool_ids)
  end

  def last_active_pool
    active_pools.order(:updated_at).last
  end
end
