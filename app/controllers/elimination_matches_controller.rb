class EliminationMatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @elimination_matches = EliminationMatch.all
  end

  def show
  end

  def new
    @elimination_match = EliminationMatch.new
  end

  def edit
  end

  def create
    @elimination_match = EliminationMatch.new(match_params)
    if @elimination_match.save
      redirect_to elimination_matches_path notice: 'Elimination Match was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @elimination_match.update(match_params)
        format.html { redirect_to elimination_matches_path, notice: 'Elimination Match was successfully updated.'}
        format.js

      else
        format { render :edit }
        format.js
      end
    end
  end

  def destroy
    @elimination_match.destroy
    redirect_to elimination_matches_url
  end

  private
    def set_match
      @elimination_match = EliminationMatch.find(params[:id])
    end

    def match_params
      params[:elimination_match].permit!
    end
end
