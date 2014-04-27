jQuery ->
  if $('#new_match').length > 0
    teams = $('#match_local_team_id').html()
    $('#match_group_id').chosen().change ->
      group = $('#match_group_id :selected').text()
      options =$(teams).filter("optgroup[label='#{group}']").html()
      $('#match_local_team_id').html(options)
      $('#match_local_team_id').trigger('chosen:updated')
      $('#match_visitor_team_id').html(options)
      $('#match_visitor_team_id').trigger('chosen:updated')