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
end
