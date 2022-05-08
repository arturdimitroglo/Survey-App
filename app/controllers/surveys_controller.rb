class SurveysController < ApplicationController
  before_action :authenticate_admin!, expept: [:index, :show]

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
    @survey = Survey.new(survey_params)

    if @survey.save
      redirect_to @survey
    else
      render :new, status: :unprocessble_entity
    end
  end

  private
  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
