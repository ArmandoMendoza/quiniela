class DocumentsController < ApplicationController
  before_action :set_pool, only: [:my_bets]

  def my_bets
    @bets = current_user.bets_in_pool(@pool)
    if @bets
      respond_to do |format|
        format.html { render text: @bets.count }
        format.pdf do
          pdf = MyBetsPdf.new
          send_data pdf.render
        end
      end
    else
      redirect_to dashboard_path, notice: "No tienes apuestas en esta quiniela - #{pool.name}"
    end
  end

  private
    def set_pool
      @pool = Pool.find_by(id: params[:pool_id])
      unless @pool
        redirect_to dashboard_path, notice: "No se encontro quiniela."
      end
    end
end
