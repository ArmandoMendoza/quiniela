class DashboardController < ApplicationController
  def index
    # @q = Bet.search(params[:q])
    # @pools = current_user.pools
    # @matches = Match.all
    # if params[:q].present?
    #   @bets = @q.result.includes({ match: :group }, :pool, :user)
    # else
    #   @bets = Bet.where(user_id: current_user.id).includes({match: :group}, :pool, :user).limit(10)
    # end
    
    @q = EliminationBet.search(params[:q])
    @pools = current_user.pools
    @matches = EliminationMatch.all
    if params[:q].present?
      @bets = @q.result.includes(:elimination_match, :pool, :user)
    else
      @bets = []
    end
  end
end

