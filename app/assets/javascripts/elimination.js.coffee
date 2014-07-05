jQuery ->
  $('.visitor-flag, .local-flag').click (e)->
    winner = $(this).data('class')
    form = $(this).closest('form')
    div = $(this).closest('.elimination_match')
    match_to_winner = div.data('match-to-winner')
    match_to_loser = div.data('match-to-loser')
    select = div.data('select')
    round = div.data('round')
    local_score = form.find('#local-score').val()
    visitor_score = form.find('#visitor-score').val()
    winner_name = form.find("##{winner}-name").val()
    winner_flag = form.find(".#{winner}-flag").html()
    if local_score == visitor_score && match_to_winner
      winner_div = $("##{match_to_winner}")
      winner_form = winner_div.find('form')
      winner_form.find("##{select}-name").val(winner_name)
      winner_form.find(".#{select}-flag").html(winner_flag)
      if match_to_loser
        loser = if winner == "local" then "visitor" else "local"
        loser_name = form.find("##{loser}-name").val()
        loser_flag = form.find(".#{loser}-flag").html()
        loser_div = $("##{match_to_loser}")
        loser_form = loser_div.find('form')
        loser_form.find("##{select}-name").val(loser_name)
        loser_form.find(".#{select}-flag").html(loser_flag)


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

    if local_score == visitor_score
      alert "Haz Click en la bandera del equipo ganador"

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

