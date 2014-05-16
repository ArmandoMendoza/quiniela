class AnswersController < ApplicationController
  authorize_resource

  def update
    @answer = Answer.find(params[:id])
    respond_to do |format|
      if @answer.update(answer_params)
        format.js
      else
        format.js
      end
    end
  end

  private
    def answer_params
      params[:answer].permit(:answer_one, :answer_two)
    end
end
