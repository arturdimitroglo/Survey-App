class SurveysController < ApplicationController
  before_action :authenticate_admin!, except: %i[index show]
  before_action :set_survey, except: %i[index new create]

  def index
    @surveys = Survey.all
  end
  
  def show
    if params[:question_id] == nil and @survey.questions.first != nil
      @question = @survey.questions.first
      @answer = @question.answers.new()
    elsif params[:question_id] != nil and @survey.questions.first != nil
      @question = Question.find(params[:question_id])
      @answer = @question.answers.new()
    else
      @question = nil
    end
  end

  def new
    @survey = Survey.new
  end

  def create 
    admin = current_admin
    @survey = admin.surveys.new(survey_params)

    if @survey.save
      redirect_to edit_survey_path(@survey)
      flash.notice = 'Created survey'
    else
      render :new, status: :unprocessable_entity
      flash.alert = 'Failed to create survey'
    end
  end

  def update
    if @survey.update(survey_params)
      redirect_to edit_survey_path(@survey)
      flash.notice = 'Updated survey'
    else
      render :edit, status: :unprocessable_entity
      flash.alert = 'Failed to update survey' 
    end
  end

  def destroy
    @survey.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
