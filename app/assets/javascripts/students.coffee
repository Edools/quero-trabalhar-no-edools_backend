# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#country').on 'change', ->
    country_id = $(this).val()

    $('#state option').remove()
    $('#state').append '<option value="">Select a State</option>'
    $('#student_address_attributes_city_id option').remove()
    $('#student_address_attributes_city_id').append '<option value="">Select a City</option>'

    $.getJSON '/states?country_id=' + country_id, (states) ->
      states.forEach (state) ->
        $option = $('<option />').html(state.name).val(state.id)
        $('#state').append $option
        return
      return
    return

  $('#state').on 'change', ->
    state_id = $(this).val()

    $('#student_address_attributes_city_id option').remove()
    $('#student_address_attributes_city_id').append '<option value="">Select a City</option>'

    $.getJSON '/cities?state_id=' + state_id, (cities) ->
      cities.forEach (city) ->
        $option = $('<option />').html(city.name).val(city.id)
        $('#student_address_attributes_city_id').append $option
        return
      return
    return
  return
