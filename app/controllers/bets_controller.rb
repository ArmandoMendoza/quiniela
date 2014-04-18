class BetsController < ApplicationController
  before_action :set_bet, except: [:index]
  authorize_resource

  def index
    if current_user.admin?
      @bets = Bet.all.includes([:user, :match, :pool])
    else
      @bets = current_user.bets.includes([:user, :match, :pool])
    end
  end

  def edit
  end

  def update
    if @bet.update(bet_params)
      redirect_to bets_path, notice: 'Bet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bet.destroy
    redirect_to bets_path
  end

  private
    def set_bet
      @bet = Bet.find(params[:id])
    end

    def bet_params
      params[:bet].permit(:local, :visitor, :match_time)
    end
end
