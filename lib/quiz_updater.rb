class QuizUpdater

  attr_accessor :quiz

  def initialize(quiz)
    @quiz = quiz
  end

  def update(quiz_params)

    quiz_params[:quiz][:questions_attributes].each do |key, val|
      id = val.delete(:id)
      if id.blank?
        quiz.questions.create!(val)
      else
        question = quiz.questions.find(id)
        question.update(val)
      end
    end

    quiz
  end
end
