# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

question_index = 0

addQuestion = ->
  question_index += 1

  html = """
    <br>
    <label>Question</label>
    <br>
    <input type="text" name="quiz[questions_attributes][#{current_index}][body]" id="quiz_questions_attributes_#{current_index}_body">
    <br>
  """

  $("#new_quiz input[type='submit']").before(html)

addAnswer = ->
  answer_index = $(this).parent().find('.answer-form').length
  html = """
  <div class="answer-form">
    <label for="quiz_questions_attributes_#{answer_index}_answers_attributes_#{answer_index}_body">Answer</label>
    <input type="text" name="quiz[questions_attributes][#{answer_index}][answers_attributes][#{answer_index}][body]" id="quiz_questions_attributes_#{answer_index}_answers_attributes_#{answer_index}_body"><br>
    <label for="quiz_questions_attributes_#{answer_index}_answers_attributes_#{answer_index}_correct">Correct</label>
    <input name="quiz[questions_attributes][#{answer_index}][answers_attributes][#{answer_index}][correct]" type="hidden" value="#{answer_index}"><input type="checkbox" value="1" name="quiz[questions_attributes][#{answer_index}][answers_attributes][#{answer_index}][correct]" id="quiz_questions_attributes_#{answer_index}_answers_attributes_#{answer_index}_correct"><br>
  </div>
  """

  $(this).before(html)



$ ->
  $('#add-question').on('click', addQuestion)
  $('#new_quiz').on('click', '.add-answer', addAnswer)

