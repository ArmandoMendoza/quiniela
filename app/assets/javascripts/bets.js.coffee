jQuery ->
  $('.input-bet').blur (e) ->
    form = this.form
    $('#check').click()
    # $(form).submit()

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
  ################


  $('#check').click ()->
    teams = $('#teams').data('teams')
    positionTable = new PositionTable
    $.each teams, (index, team) ->
      teamObj = new Team(team)
      positionTable.add_team teamObj
    rows = $('.row-widget')
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
      $('#classification').append(row)
