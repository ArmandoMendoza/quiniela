class User < ActiveRecord::Base
  ### thirt party
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  ### relations
  has_many :bets
  has_many :answers
  has_many :pools, -> { distinct }, through: :bets
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

  def create_answer_for(pool)
    Answer.create(pool: pool, user: self)
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

  def bets_in_pool_with_date(pool, date)
    bets.joins(:match).where('matches.date = ?', date).includes(:match).where(pool: pool).order('bets.pos')
  end

  def answer_of_pool(pool)
    answers.where(pool_id: pool.id).first
  end

  def total_points_in_pool(pool)
    bets.where(pool_id: pool.id).sum(:points)
  end

  def active_pools
    pools.active
  end

  def last_active_pool
    active_pools.order(:updated_at).last
  end

  private
    def set_nickname
      self.nickname = [name, last_name].join("_").underscore unless nickname.present? and name.present?
    end
end
