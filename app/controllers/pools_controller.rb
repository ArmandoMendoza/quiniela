class PoolsController < ApplicationController
  before_action :set_pool, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @pools = Pool.all
  end

  def show
    @bets = @pool.bets.includes(:match).where(user: current_user)
    @groups = Group.includes(:teams).all
  end

  def new
    @pool = Pool.new
  end

  def edit
  end

  def create
    @pool = Pool.new(pool_params)
    if @pool.save
      redirect_to @pool, notice: 'Pool was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pool.update(pool_params)
      redirect_to @pool, notice: 'Pool was successfully updated.'
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
end
