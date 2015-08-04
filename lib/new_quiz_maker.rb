class NewQuizMaker
  def initialize
    #set state as needed
  end

  def blank_quiz
    quiz = Quiz.new
    question = Question.new
    answer = Answer.new
    question.answers << answer
    quiz.questions << question
    quiz
  end
end
