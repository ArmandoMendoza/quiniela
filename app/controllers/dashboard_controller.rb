class DashboardController < ApplicationController
  def index
    @pools = current_user.pools
    @matches = Match.all
    if params[:q].present?
      @q = Bet.search(params[:q])
      @bets = @q.result.includes({ match: :group }, :pool, :user)
    else
      @q = Bet.search(params[:q])
      @bets = Bet.where(user_id: current_user.id).includes({match: :group}, :pool, :user).limit(10)
    end
  end
end
