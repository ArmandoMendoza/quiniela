class AllBetsPdf < Prawn::Document

  def initialize(pool, users)
    super()
    @pool = pool
    @users = users
    generate_tables
  end

  def header(user)
    font_size(20) { text @pool.name, align: :center, style: :bold }
    draw_text "Jugador:  #{user.full_name} - #{user.nickname}", at: [0,680]
    draw_text "Fecha: #{Time.now.strftime("%d-%m-%Y  %H:%M")}", at: [320, 680]
    draw_text "Goleador del Mundial: #{user.answers.on_pool(@pool).player}", at: [0,660]
    draw_text "Equipo Ganador: #{user.answers.on_pool(@pool).team}", at: [320,660]
  end

  def body(bets, e_bets)
    move_down 60
    text "RONDA CLASIFICACION"
    table clasification(bets)
    start_new_page
    text "RONDA ELIMINACION"
    table elimination(e_bets), cell_style: { size: 8 }
  end

  def clasification(bets)
    [["id","Grupo", "Juego", "Fecha", "Hora", "Resultado", "Apuesta", "Puntos"]] +
    bets.map do |bet|
      bet.match.get_teams
      [ bet.id, bet.match.group.name, bet.match.to_s, bet.match.date.strftime('%d-%m'),
        bet.match.hour, bet.match.score_to_s, bet.to_s, bet.points ]
    end
  end

  def elimination(e_bets)
    [["id", "Ronda", "Fecha", "Hora", "Partido", "Resultado", "Apuesta", "Resultado", "Puntos"]] +
    e_bets.map do |bet|
      # bet.elimination_match.get_teams
      [ bet.id, bet.elimination_match.round, bet.elimination_match.date.strftime('%d-%m'),
        bet.elimination_match.hour, bet.elimination_match.to_s, bet.elimination_match.score_to_s,
        bet.to_s, bet.score_to_s, bet.points ]
    end
  end

  def rows(bets)
    [["id","Grupo", "Juego", "Fecha", "Hora", "Resultado", "Apuesta", "Puntos"]] +
    bets.map do |bet|
      bet.match.get_teams
      [ bet.id, bet.match.group.name, bet.match.to_s, bet.match.date.strftime('%d-%m'),
        bet.match.hour, bet.match.score_to_s, bet.to_s, bet.points ]
    end
  end

  def generate_tables
    @users.each do |user|
      bets = user.bets_in_pool(@pool).order(['matches.group_id', 'bets.pos'])
      e_bets = user.elimination_bets_in_pool(@pool).order('elimination_matches.match_number')
      header(user)
      body(bets, e_bets)
      start_new_page
    end
  end
end