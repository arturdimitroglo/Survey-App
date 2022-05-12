class QuestionsController < ApplicationController
  before_action :authenticate_admin!, except: %i[index show]

  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new  
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new(question_params)

    if @question.save
      redirect_to new_survey_question_path(@survey)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :question_type, :choice_1, :choice_2, :choice_3, :choice_4, :choice_5, :choice_6, :open_ended_answer)
  end
end
