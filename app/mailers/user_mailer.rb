class UserMailer < ActionMailer::Base
  default from: "quinielaquintus@gmail.com"

  def registration_email(registration)
    @registration = registration
    mail(to: @registration.email, subject: 'Aviso de Registro')
  end

  def new_user_email(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: 'Creacion de Cuenta')
  end
end
