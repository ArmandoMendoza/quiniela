class PoolsController < ApplicationController
  before_action :set_pool, except: [:index, :new, :create]
  before_action :check_status_of_pool, only: :bets
  authorize_resource

  def index
    @pools = Pool.all
  end

  def show
    if current_user.regular?
      @matches = @pool.matches.includes(:group).by_date(Date.current)
      @bets = current_user.bets_in_pool_with_date(@pool, Date.current)
      @users = @pool.users
      @table = @pool.users_classification
    end
  end

  def results
    @bets = @pool.bets_of_user(current_user)
    @groups = Group.includes(:teams).all
  end

  def bets
    results
  end

  def elimination_bets
    @elimination_bets = @pool.elimination_bets_of_user(current_user)
  end

  def new
    @pool = Pool.new
  end

  def edit
  end

  def create
    @pool = Pool.new(pool_params)
    if @pool.save
      redirect_to pools_path, notice: 'Pool was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pool.update(pool_params)
      redirect_to pools_path, notice: 'Pool was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pool.destroy
    redirect_to pools_url
  end

  private
    def set_pool
      @pool = Pool.find(params[:id])
    end

    def pool_params
      params[:pool].permit!
    end

    def check_status_of_pool
      redirect_to(pool_path(@pool),
        notice: "El tiempo para completar tus pronosticos ha terminado") if @pool.stopped
    end
end
