class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = NewQuizMaker.new.blank_quiz
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    QuizUpdater.new(@quiz).update(quiz_params)
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
       :questions_attributes => [:id,
                                 :body,
                                 :answers_attributes =>[:id,
                                                        :body,
                                                        :correct]])
  end
end
