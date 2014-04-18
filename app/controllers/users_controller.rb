class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  before_action :check_params_password, only: :update
  authorize_resource

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  def bets
    @pools = Pool.active
    redirect_to(users_path, notice: "No hay Quinielas activas") if @pools.empty?
  end

  def create_bets
    if params[:pool_id]
      pool = Pool.active.find(params[:pool_id])
      @user.create_bets_from(pool)
      redirect_to @user, notice: "Apuestas creadas con exito!"
    else
      redirect_to bets_user_path(@user), notice: 'Seleccione una Quiniela activa'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params[:user].permit!
    end

    def check_params_password
      if params[:user][:password].blank?
        params[:user].delete(:password)
        if params[:user][:password_confirmation].blank?
          params[:user].delete(:password_confirmation)
        end
      end
    end
end