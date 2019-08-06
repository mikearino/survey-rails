class QuestionsController < ApplicationController

  def new
    survey_id = params[:survey_id]
    @survey = Survey.find(survey_id)
    @question = @survey.questions.new
    render :new
  end

  def create
    survey_id = params[:survey_id]
    @survey = Survey.find(survey_id)
    # this is creating a question, but we're not using Question.new, we're using survey.questions.new so that it automagically has the survey_id associated with it
    @question = @survey.questions.new(question_params)

    if @question.save
      redirect_to survey_path(survey_id)
    else
      render :new
    end
  end

  private def question_params
    params.require(:question).permit(:prompt)
  end

end
