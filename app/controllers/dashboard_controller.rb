class DashboardController < ApplicationController
  before_action :set_pool

  def index
    if current_user.regular? && @pool.present?
      @matches = @pool.matches.includes(:group).by_date(Date.today)
      @bets = current_user.bets_in_pool_with_date(@pool, Date.today)
      @users = @pool.users
      @table = @pool.users_classification
    else
      render "notice"
    end
  end

  private
    def set_pool
      @pool = current_user.last_active_pool
    end
end
