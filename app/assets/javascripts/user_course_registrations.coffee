$(document).on 'turbolinks:load', ->
  $('.invite_button').on 'click', ->
    id = parseInt(window.location.pathname.split('/')[2])
    $.ajax '/user_course_registrations/',
      type: 'POST'
      dataType: 'json'
      data: { user_course_registration: { course_id: id} }
      success: (data, text, jqXHR) ->
        console.log(data)
        if data == false
          Materialize.toast 'Usuário já cadastrado no curso!', 4000, 'red'
        else
          window.location = '/user_course_registrations/'+data['id']

      error: (jqXHR, textStatus, errorThrown) ->
        console.log('error','data')

        Materialize.toast 'Problema no cadastro no curso!', 4000, 'red'
    return false