class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "home"

  def index
    @registration = Registration.new
    @contact = Contact.new
  end

  def registration
    params_registration = params[:registration].permit!
    @registration = Registration.new(params_registration)
    if @registration.save
      redirect_to root_path, notice: "Registro creado... Gracias por participar!!!"
    else
      @contact = Contact.new
      render :index
    end
  end

  def contact
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to root_path, notice: 'Gracias por tu mensaje!'
    else
      @registration = Registration.new
      flash.now[:notice] = 'No se puedo enviar mensaje.'
      render :index
    end
  end
end
