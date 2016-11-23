jQuery ->
  $(document).on 'change', '[data-action=filter]', ->
    $.get($(this).data('url'), q: $(this).val())
