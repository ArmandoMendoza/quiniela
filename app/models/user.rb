class User < ActiveRecord::Base
  ### thirt party
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  ### relations
  has_many :bets, dependent: :delete_all
  has_many :elimination_bets, dependent: :delete_all
  has_many :answers, dependent: :delete_all
  has_many :pools, -> { distinct }, through: :bets
  has_many :e_pools, -> { distinct }, through: :elimination_bets, source: :pool

  ### scopes
  scope :order_by_last_name, -> { order(:last_name) }
  ### validations
  validates_presence_of :name, :last_name, :email
  validates_uniqueness_of :email, :nickname
  ### Callbacks
  before_save :set_nickname

  ### instance methods
  def full_name
    "#{name} #{last_name}"
  end

  def create_bets_from(pool)
    Bet.create_all_bets_for(self, pool)
  end

  def create_elimination_bets_from(pool)
    EliminationBet.create_all_bets_for(self, pool)
  end

  def create_answer_for(pool)
    Answer.create_answer_for(self, pool)
  end

  def admin?
    role == "admin"
  end

  def regular?
    role == "regular"
  end

  def bets_in_pool(pool)
    bets.where(pool_id: pool.id).includes(match: :group)#.order('matches.group_id')
  end

  def elimination_bets_in_pool(pool)
    elimination_bets.where(pool_id: pool.id).includes(:match)#.order('matches.group_id')
  end

  def bets_in_pool_with_date(pool, date)
    bets.joins(:match).where('matches.date = ?', date).where(pool: pool).order('bets.pos')
  end

  def elimination_bets_in_pool_with_date(pool, date)
    elimination_bets.joins(:elimination_match).where('elimination_matches.date = ?', date).
    where(pool: pool).order('elimination_matches.match_number')
  end

  def answer_of_pool(pool)
    answers.where(pool_id: pool.id).first
  end

  def total_points_in_pool(pool)
    bets.where(pool_id: pool.id).sum(:points)
  end

  def total_elimination_points_in_pool(pool)
    elimination_bets.where(pool_id: pool.id).sum(:points)
  end

  def active_pools
   (pools.active + e_pools.active).uniq
  end

  def all_pools
    (pools + e_pools).uniq
  end

  def find_pool(id)
    pool = pools.where(id: id)
    e_pool = e_pools.where(id: id)
    (pool + e_pool).first
  end

  def last_active_pool
    active_pools.order(:updated_at).last
  end

  def delete_bets_of_pool(pool)
    bets_in_pool(pool).delete_all
  end

  def delete_elimination_bets_of_pool(pool)
    elimination_bets_in_pool(pool).delete_all
  end

  def delete_anwser_of_pool(pool)
    answer_of_pool(pool).delete
  end

  private
    def set_nickname
      self.nickname = [name, last_name].join("_").underscore unless nickname.present? and name.present?
    end
end
