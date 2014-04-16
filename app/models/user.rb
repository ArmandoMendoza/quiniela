class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email

  def admin?
    role == "admin"
  end

  def regular?
    role == "regular"
  end
end
