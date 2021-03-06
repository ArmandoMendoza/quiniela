class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params[:group].permit!
    end
end
