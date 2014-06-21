class Registration < ActiveRecord::Base
  ### Relations
  belongs_to :pool
  ### Validations
  validates_presence_of :name, :last_name, :phone, :email, :pool_id
  validates_uniqueness_of :email, :nickname
  before_create :set_status

  ### Instance methods

  def create_user
    password = "12345678"
    user = User.create(name: name, last_name: last_name, nickname: nickname, email: email,
      phone: phone, role: "regular", password: password, password_confirmation: "12345678")
    if user.errors.empty?
      user.create_bets_from(pool)
      user.create_answer_for(pool)
      update_column(:status, "registered")
      UserMailer.new_user_email(user, password).deliver
    end
    user
  end

  private
    def set_status
      self.status = "unregistered" unless self.status.present?
    end
end