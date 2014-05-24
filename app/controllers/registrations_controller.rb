class RegistrationsController < ApplicationController
  before_action :set_pool
  authorize_resource

  def index
    @registrations = @pool.registrations
  end

  def destroy
    @registration = @pool.registrations.find(params[:id])
    @registration.destroy
    redirect_to pool_registrations_path(@pool)
  end

  private
    def set_pool
      @pool = Pool.find(params[:pool_id])
    end
end
