jQuery ->
  $('.link-prueba').click (e)->
    form = $(this).closest('form')
    div = $(this).closest('.elimination_match')
    next = div.data('next')
    select = div.data('select')
    local_score = form.find('#local-score').val()
    visitor_score = form.find('#visitor-score').val()
    local_name = form.find('#local-name').val()
    visitor_name = form.find('#visitor-name').val()
    local_flag = form.find('#local-flag').html()
    visitor_flag = form.find('#visitor-flag').html()
    next_div = $("##{next}")
    next_form = next_div.find('form')
    if local_score > visitor_score
      next_form.find("##{select}-name").val(local_name)
      next_form.find("##{select}-flag").html(local_flag)
    if local_score < visitor_score
      next_form.find("##{select}-name").val(visitor_name)
      next_form.find("##{select}-flag").html(visitor_flag)
    form.submit()
    e.preventDefault()
    false

