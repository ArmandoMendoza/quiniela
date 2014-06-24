jQuery ->
  $('.link-prueba').click ->
    form = $(this).closest('form')
    div = $(this).closest('.elimination_match')
    score_local = form.find('#score-local').val()
    score_visitor = form.find('#score-visitor').val()

