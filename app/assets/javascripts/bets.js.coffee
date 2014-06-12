jQuery ->

  ### Bind a formulario para capturar eventos ajax ####
  if $('form.edit_bet').length > 0
    $('form.edit_bet').bind "ajax:beforeSend", (evt, xhr, settings) ->
      form = $(this)
      form.find('.input-bet').css('background-color', '#f2dede')

  $('div.group').first().show()

  $('.group-link').click (e)->
    e.preventDefault()
    id = $(this).data('id')
    if $('.input-bet').length > 0
      calculate($("div.group#g#{id}"))
    prev = $('div.group').not(':hidden').data('id')
    if prev < id
      directions = { prev: "right", curr: "left" }
    if prev > id
      directions = { prev: "left", curr: "right" }
    if prev == id
      return
    $('div.group').not(':hidden').toggle 'slide', { direction: directions.prev }, 'fast', ->
      $("#g#{id}").show('slide', { direction: directions.curr }, 'fast')
    false

  ###### Calculate points #######
  class Team
    constructor: (@name) ->
    matches: 0
    win: 0
    draw: 0
    lose: 0
    goles_favor: 0
    goles_contra: 0
    points: 0

  class Local
    constructor: (@name, @goals) ->

  class Visitor
    constructor: (@name, @goals) ->

  class PositionTable
    constructor: ->
      @teams = []
    orderedTeams: ->
      @teams.sort (a, b)->
        b.points - a.points
    add_team: (team)->
      @teams.push(team)
    find_team: (name)->
      for team in @teams
        return team if team.name == name
    winTeam: (teamData, goles_favor, goles_contra) ->
      teamData.matches = teamData.matches + 1
      teamData.win = teamData.win + 1
      teamData.goles_favor = teamData.goles_favor + goles_favor
      teamData.goles_contra = teamData.goles_contra + goles_contra
      teamData.points = teamData.points + 3
    loseTeam: (teamData, goles_favor, goles_contra) ->
      teamData.matches = teamData.matches + 1
      teamData.lose = teamData.lose + 1
      teamData.goles_favor = teamData.goles_favor + goles_favor
      teamData.goles_contra = teamData.goles_contra + goles_contra
    drawTeam: (teamData, goles_favor, goles_contra) ->
      teamData.matches = teamData.matches + 1
      teamData.draw = teamData.draw + 1
      teamData.goles_favor = teamData.goles_favor + goles_favor
      teamData.goles_contra = teamData.goles_contra + goles_contra
      teamData.points = teamData.points + 1
    calculate_points: (local, visitor) ->
      localData = this.find_team(local.name)
      visitorData = this.find_team(visitor.name)
      if local.goals > visitor.goals
        this.winTeam(localData, local.goals, visitor.goals)
        this.loseTeam(visitorData, visitor.goals, local.goals)
      if visitor.goals > local.goals
        this.winTeam(visitorData, visitor.goals, local.goals)
        this.loseTeam(localData, local.goals, visitor.goals)
      if local.goals == visitor.goals
        this.drawTeam(localData, local.goals, visitor.goals)
        this.drawTeam(visitorData, visitor.goals, local.goals)

  calculate = (group)->
    teams = group.data('teams')
    id = group.data('id')
    positionTable = new PositionTable
    $.each teams, (index, team) ->
      teamObj = new Team(team)
      positionTable.add_team teamObj
    rows = $(group).find('.row-widget')
    $.each rows, (index, row)->
      inputs = $(row).find('.input-bet')
      localInfo = $(inputs[0])
      visitorInfo = $(inputs[1])
      local = new Local(localInfo.data('team'), parseInt(localInfo.val()))
      visitor = new Visitor(visitorInfo.data('team'), parseInt(visitorInfo.val()))
      positionTable.calculate_points(local, visitor)
    $.each positionTable.orderedTeams(), (index, team) ->
      row = $("##{team.name}")
      row.find('td.matches').html(team.matches)
      row.find('td.win').html(team.win)
      row.find('td.draw').html(team.draw)
      row.find('td.lose').html(team.lose)
      row.find('td.goles_favor').html(team.goles_favor)
      row.find('td.goles_contra').html(team.goles_contra)
      row.find('td.points').html(team.points)
      row.remove()
      $(".classification#group_#{id}").append(row)
    t = $(".classification#group_#{id} tbody tr.row-team")
    first = $(t[0]).data('abrr')
    second = $(t[1]).data('abrr')
    $("#group_#{id} .teams-classified").html("#{first} - #{second}")

  ################

  $('.input-bet').blur ()->
    form = this.form
    group = $(this).parents('div.group')
    $(form).submit()
    calculate(group)

  $('#answer_answer_one').blur ()->
    form = this.form
    $(form).submit()

  $('#answer_answer_two').chosen().change ->
    form = this.form
    $(form).submit()

  ##Calculo inicial
  if $("div.group#g1").length > 0 && $('.input-bet').length > 0
    calculate($("div.group#g1"))