class EliminationBetsController < ApplicationController
  before_action :set_bet, except: :index
  authorize_resource

  def index
    if current_user.admin?
      @elimination_bets = EliminationBet.all.includes([:user, :pool, :elimination_match])
    else
      @elimination_bets = current_user.elimination_bets.includes([:pool, :elimination_match])
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @elimination_bet.update(bet_params)
        format.html { redirect_to elimination_bets_path, notice: 'Bet was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @bet.destroy
    redirect_to elimination_bets_path
  end

  private
    def set_bet
      @elimination_bet = EliminationBet.find(params[:id])
    end

    def bet_params
      params[:elimination_bet].permit(:local, :visitor, :local_name, :visitor_name)
    end
end
