class ScoresController < ApplicationController
  before_action :set_match
  before_action :set_score, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @scores = @match.scores.all
  end

  def show
  end

  def new
    @score = Score.new(match_time: Score::MATCH_TIMES["Partido"])
  end

  def edit
  end

  def create
    @score = Score.new(score_params)
    respond_to do |format|
      if @match.scores << @score
        format.js
        format.html { redirect_to match_scores_path(@match), notice: 'Match was successfully created.' }
      else
        format.js
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @score.update(score_params)
        format.js
        format.html { redirect_to match_scores_path(@match), notice: 'Match was successfully updated.' }
      else
        format.js
        format.html { render :edit }
      end
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
