class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
    #this line is needed to make one question form show up
    #in the view (see the fields_for section of the form for
    #the nested part about filling out this question
    @quiz.questions << Question.new
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def create
    @quiz = Quiz.new quiz_params
    @quiz.users << current_user
    @quiz.save
    redirect_to quiz_path(@quiz)
  end

  private

  def quiz_params
    #had to use pry to see that the form data for the nested
    #question(s) comes in through "questions_attributes"
    params.require(:quiz).permit(:name,
                                 :questions_attributes => [:body])
  end
end
