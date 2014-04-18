class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email
  has_many :bets

  def create_bets_from(pool)
    Bet.create_all_bets_for(self, pool)
  end

  def admin?
    role == "admin"
  end

  def regular?
    role == "regular"
  end
end
