class SurveysController < ApplicationController
  before_action :authenticate_admin!, except: %i[index show]

  def index
    @surveys = Survey.all
  end
  
  def show
    @survey = Survey.find(params[:id])
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
      redirect_to @survey
    else
      render :edit, status: :unprocessble_entity
    end
  end

  private
  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
