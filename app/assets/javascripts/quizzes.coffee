# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

current_index = 1

addQuestion = ->
  html = """
    <br>
    <label>Question</label>
    <br>
    <input type="text" name="quiz[questions_attributes][#{current_index}][body]" id="quiz_questions_attributes_#{current_index}_body">
    <br>
    <input type="text" name="quiz[questions_attributes][#{current_index}][answer]" id="quiz_questions_attributes_#{current_index}_answer">
    <br>
  """

  $("#new_quiz input[type='submit']").before(html)
  current_index += 1


$ ->
  $('#add-question').on('click', addQuestion)

