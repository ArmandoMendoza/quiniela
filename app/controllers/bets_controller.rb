class BetsController < ApplicationController
  before_action :set_bet, except: :index
  authorize_resource

  def index
    if current_user.admin?
      @bets = Bet.all.includes([:user,:pool, { match: :group }])
    else
      @bets = current_user.bets.includes([{ match: :group }, :pool])
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to bets_path, notice: 'Bet was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
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
