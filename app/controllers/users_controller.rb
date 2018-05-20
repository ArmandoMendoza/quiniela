class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  before_action :check_params_password, only: :update
  authorize_resource

  def index
    @users = User.all.order_by_last_name
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
      UserMailer.new_user_email(@user, @user.password).deliver_now
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  def bets
    @pools = Pool.all #Pool.active_for_user(@user)
    # redirect_to(users_path, notice: "No hay Quinielas activas") if @pools.empty?
  end

  def create_bets
    if params[:pool_id]
      pool = Pool.active.find(params[:pool_id])
      @user.create_bets_from(pool)
      @user.create_elimination_bets_from(pool)
      @user.create_answer_for(pool)
      redirect_to users_url, notice: "Apuestas creadas con exito!"
    else
      redirect_to bets_user_path(@user), notice: 'Seleccione una Quiniela activa'
    end
  end

  def destroy_bets
    if params[:pool_id]
      pool = @user.find_pool(params[:pool_id])
      @user.delete_bets_of_pool(pool)
      @user.delete_elimination_bets_of_pool(pool)
      @user.delete_anwser_of_pool(pool)
      redirect_to users_url, notice: "Apuestas Eliminadas con exito!"
    else
      redirect_to bets_user_path(@user), notice: 'Seleccione una Quiniela del Usuario'
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