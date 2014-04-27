jQuery ->
  $('.input-bet').blur (e) ->
    form = this.form
    $(form).submit()