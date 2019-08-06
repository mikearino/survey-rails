class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
    render :default
  end

  def show
    id = params[:id]
    @survey = Survey.find(id)
    render :show
  end

  def new
    @surveys = Survey.all
    render :new
  end

  def create
    title = params[:title]
    survey = Survey.create(:title => title)
    survey.save
    redirect_to '/surveys'
  end

  def take
    survey_id = params[:survey_id]
    @survey = Survey.find(survey_id)
    @answer = Answer.new
    @questions = @survey.questions
    render :take
  end

  def submit
    bugbye
  end

end
