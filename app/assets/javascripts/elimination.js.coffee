jQuery ->
  $('.visitor-flag, .local-flag').click (e)->
    tp = $(this).data('class')
    form = $(this).closest('form')
    div = $(this).closest('.elimination_match')
    match_to_winner = div.data('match-to-winner')
    match_to_loser = div.data('match-to-loser')
    select = div.data('select')
    round = div.data('round')
    local_score = form.find('#local-score').val()
    visitor_score = form.find('#visitor-score').val()
    name = form.find("##{tp}-name").val()
    flag = form.find(".#{tp}-flag").html()
    if local_score == visitor_score && match_to_winner
      winner_div = $("##{match_to_winner}")
      winner_form = winner_div.find('form')
      winner_form.find("##{select}-name").val(name)
      winner_form.find(".#{select}-flag").html(flag)

  $('.link-prueba').click (e)->
    form = $(this).closest('form')
    div = $(this).closest('.elimination_match')
    match_to_winner = div.data('match-to-winner')
    match_to_loser = div.data('match-to-loser')
    select = div.data('select')
    round = div.data('round')
    local_score = form.find('#local-score').val()
    visitor_score = form.find('#visitor-score').val()
    local_name = form.find('#local-name').val()
    visitor_name = form.find('#visitor-name').val()
    local_flag = form.find('.local-flag').html()
    visitor_flag = form.find('.visitor-flag').html()

    if match_to_winner
      winner_div = $("##{match_to_winner}")
      winner_form = winner_div.find('form')
      if local_score > visitor_score
        winner_form.find("##{select}-name").val(local_name)
        winner_form.find(".#{select}-flag").html(local_flag)
      if local_score < visitor_score
        winner_form.find("##{select}-name").val(visitor_name)
        winner_form.find(".#{select}-flag").html(visitor_flag)
    if match_to_loser
      loser_div = $("##{match_to_loser}")
      loser_form = loser_div.find('form')
      if local_score > visitor_score
        loser_form.find("##{select}-name").val(visitor_name)
        loser_form.find(".#{select}-flag").html(visitor_flag)
      if local_score < visitor_score
        loser_form.find("##{select}-name").val(local_name)
        loser_form.find(".#{select}-flag").html(local_flag)
    form.submit()
    e.preventDefault()
    false

