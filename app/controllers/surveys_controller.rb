class SurveysController < ApplicationController
  before_action :authenticate_admin!, except: %i[index show]

  def index
    @surveys = Survey.all
  end
  
  def show
    @survey = Survey.find(params[:id])
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
      redirect_to @survey
    else
      render :new, status: :unprocessble_entity
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])

    if @survey.update(survey_params)
      redirect_to edit_survey_path(@survey)
    else
      render :edit, status: :unprocessble_entity
    end
  end

  def destroy
    @survey = Survey.find(params[:survey_id])

    @survey.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
