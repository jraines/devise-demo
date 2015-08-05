class QuizUpdater

  attr_accessor :quiz, :quiz_params

  def initialize(quiz)
    @quiz = quiz
  end

  def update(quiz_params)
    @quiz_params = quiz_params
    delete_removed_questions

    quiz_params[:questions_attributes].each do |_, qa|
      id = qa.delete(:id)
      if id.blank?
        quiz.questions.create!(qa)
      else
        question = quiz.questions.find(id)
        question.update(qa)
      end
    end

    quiz
  end

  private

  def delete_removed_questions
    quiz_question_ids = quiz.questions.pluck :id

    submitted_question_ids = quiz_params[:questions_attributes].map do |_, qa|
      qa[:id].to_i
    end.compact

    ids_of_questions_to_delete = quiz_question_ids - submitted_question_ids
    quiz.questions.where(id: ids_of_questions_to_delete).destroy_all
    quiz.reload
  end

end
