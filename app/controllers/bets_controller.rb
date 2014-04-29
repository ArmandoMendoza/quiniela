class BetsController < ApplicationController
  before_action :set_bet, except: :index
  before_action :check_group, only: :index
  authorize_resource

  def index
    if current_user.admin?
      @bets = Bet.all.includes([:user, :match, :pool])
      @bets = @bets.of_group(@group)
    else
      @bets = current_user.bets.includes([:match, :pool])
      @bets = @bets.of_group(@group)
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

    def check_group
      @group = params[:group_id] ? Group.find(params[:group_id]) : @group = Group.first
    end

    def bet_params
      params[:bet].permit(:local, :visitor, :match_time)
    end
end
