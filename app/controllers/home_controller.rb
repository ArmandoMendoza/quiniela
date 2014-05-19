class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "home"

  def index
    @register = Register.new
  end

  def register
    params_register = params[:register].permit!
    @register = Register.new(params_register)
    if @register.save
      redirect_to root_path, notice: "Registro creado... Gracias por participar!!!"
    else
      render :index
    end
  end
end
