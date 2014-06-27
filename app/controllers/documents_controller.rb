class DocumentsController < ApplicationController
  before_action :set_pool, only: [:my_bets, :all_bets]

  def my_bets
    if @pool
      respond_to do |format|
        format.html
        format.pdf do
          pdf = MyBetsPdf.new(@pool, current_user)
          send_data pdf.render, filename: "mis_apuestas-#{@pool.name}.pdf",
            type: "application/pdf", disposition: 'inline'
        end
      end
    else
      redirect_to dashboard_path, notice: "No tienes apuestas en esta quiniela - #{pool.name}"
    end
  end

  def all_bets

    @users = @pool.users
    if @users.any?
      respond_to do |format|
        format.html { render "all_bets", layout: false }
        format.pdf do
          pdf = AllBetsPdf.new(@pool, @users)
          send_data pdf.render, filename: "todas_las_apuestas-#{@pool.name}.pdf",
            type: "application/pdf", disposition: 'inline'
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
