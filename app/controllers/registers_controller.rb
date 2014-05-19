class RegistersController < ApplicationController
  before_action :set_pool
  authorize_resource

  def index
    @registers = @pool.registers
  end

  def destroy
    @register = @pool.registers.find(params[:id])
    @register.destroy
    redirect_to pool_registers_path(@pool)
  end

  private
    def set_pool
      @pool = Pool.find(params[:pool_id])
    end
end
