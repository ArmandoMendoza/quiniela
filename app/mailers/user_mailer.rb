class UserMailer < ActionMailer::Base
  default from: "quinielaquintus@gmail.com"

  def registration_email(registration)
    @registration = registration
    mail(to: @registration.email, subject: 'Aviso de Registro')
  end
end
