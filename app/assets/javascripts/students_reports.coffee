# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#generate_pdf').on 'click', (event) ->
    event.preventDefault()
    school_id = $('#school').val()
    window.open($(this).attr('href') + '?school=' + school_id, "_blank")
    return
  return
