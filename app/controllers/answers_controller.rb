class AnswersController < ApplicationController
  def create
    
  end

  private
  def answer_params
    params.require(:answer).permit(:choice_1, :choice_2, :choice_3, :choice_4, :choice_5, :choice_6, :open_ended_answer)
  end
end
