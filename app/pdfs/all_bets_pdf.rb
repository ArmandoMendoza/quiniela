class AllBetsPdf < Prawn::Document

  def initialize(pool, users)
    super()
    @pool = pool
    @users = users
    generate_tables
  end

  def header(user)
    font_size(20) { text @pool.name, align: :center, style: :bold }
    draw_text "Jugador:  #{user.full_name}", at: [0,680]
    draw_text "Fecha: #{Time.now.strftime("%d-%m-%Y  %H:%M")}", at: [320, 680]
  end

  def body(bets)
    move_down 30
    table rows(bets)
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
      bets = Bet.of_user_in_pool(user, @pool).order(['matches.group_id', 'bets.pos'])
      header(user)
      body(bets)
      start_new_page
    end
  end
end