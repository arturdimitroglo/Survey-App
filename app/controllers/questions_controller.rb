class QuestionsController < ApplicationController
  before_action :authenticate_admin!, except: %i[index show]

  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new
    if params[:question_type] != nil
      redirect_to return_url(params[:question_type], params[:survey_id]) 
    end    
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
  def return_url(question_type, survey_id)
    url_from("surveys/#{survey_id}/questions/new_#{question_type}")
  end
  def question_params
    params.require(:question).permit(:title, :question_type)
  end
end
