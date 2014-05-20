class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "home"

  def index
    @register = Register.new
    @contact = Contact.new
  end

  def register
    params_register = params[:register].permit!
    @register = Register.new(params_register)
    if @register.save
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
      @register = Register.new
      flash.now[:notice] = 'No se puedo enviar mensaje.'
      render :index
    end
  end
end
