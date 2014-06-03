class RegistrationsController < ApplicationController
  before_action :set_pool
  authorize_resource

  def index
    @registrations = @pool.registrations
  end

  def register
    @registration = @pool.registrations.find(params[:id])
    user = @registration.create_user
    if user.errors.empty?
      notice = "Usuario registrado con exito!"
    else
      notice = user.errors.full_messages.join(" - ")
    end
    redirect_to pool_registrations_path(@pool), notice: notice
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
