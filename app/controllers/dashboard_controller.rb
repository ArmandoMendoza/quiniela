class DashboardController < ApplicationController

  def index
    unless current_user.admin?
      @pool = current_user.last_active_pool
      @matches = @pool.matches.includes(:group).by_date(Date.today)
      @bets = @pool.bets.with_matches_by_date(Date.today)
      @users = @pool.uniq_users
      @table = @pool.users_classification
    end
  end
end
