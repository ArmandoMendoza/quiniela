class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @matches = Match.includes(:group).all
  end

  def show
  end

  def new
    @match = Match.new
    @groups = Group.all.includes(:teams)
  end

  def edit
    @groups = Group.all.includes(:teams)
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to matches_path notice: 'Match was successfully created.'
    else
      @groups = Group.all.includes(:teams)
      render :new
    end
  end

  def update
    if @match.update(match_params)
      redirect_to matches_path, notice: 'Match was successfully updated.'
    else
      @groups = Group.all.includes(:teams)
      render :edit
    end
  end

  def destroy
    @match.destroy
    redirect_to matches_url
  end

  private
    def set_match
      @match = Match.find(params[:id])
    end

    def match_params
      params[:match].permit!
    end
end
