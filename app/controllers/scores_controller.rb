class ScoresController < ApplicationController
  before_action :set_match
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  def index
    @scores = @match.scores.all
  end

  def show
  end

  def new
    @score = Score.new
  end

  def edit
  end

  def create
    @score = Score.new(score_params)
    if @match.scores << @score
      redirect_to match_scores_path(@match), notice: 'Match was successfully created.'
    else
      render :new
    end
  end

  def update
    if @score.update(score_params)
      redirect_to match_scores_path(@match), notice: 'Match was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @score.destroy
    redirect_to match_scores_path(@match)
  end

  private
    def set_match
      @match = Match.find(params[:match_id])
    end

    def set_score
      @score = @match.scores.find(params[:id])
    end

    def score_params
      params[:score].permit!
    end
end
