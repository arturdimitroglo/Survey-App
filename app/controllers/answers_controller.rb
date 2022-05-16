class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    if answer.save
      redirect_to @answer.question
    else
    end
  end

  private
  def answer_params
    params.require(:answer).permit:(question_id,:choice_1, :choice_2, :choice_3, :choice_4, :choice_5, :choice_6, :open_ended_answer)
  end
end
