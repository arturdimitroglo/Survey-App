class QuestionsController < ApplicationController
  before_action :authenticate_admin!, except: %i[index show]

  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new  
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question.survey
    else
      render :new, status: :unprocessble_entity
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :question_type)
  end
end
