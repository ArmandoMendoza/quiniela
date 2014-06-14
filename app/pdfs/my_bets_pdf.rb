class MyBetsPdf < Prawn::Document

  def initialize(pool, bets, user)
    super()
    @pool = pool
    @bets = bets
    @user = user
    header
    body
  end

  def header
    font_size(20) { text @pool.name, align: :center, style: :bold }
    draw_text "Jugador:  #{@user.full_name}", at: [0,680]
    draw_text "Fecha: #{Time.now.strftime("%d-%m-%Y  %H:%M")}", at: [320, 680]
  end

  def body
    move_down 30
    table rows
  end

  def rows
    [["id","Grupo", "Juego", "Fecha", "Hora", "Resultado", "Apuesta", "Puntos"]] +
    @bets.map do |bet|
      bet.match.get_teams
      [ bet.id, bet.match.group.name, bet.match.to_s, bet.match.date.strftime('%d-%m'),
        bet.match.hour, bet.match.score_to_s, bet.to_s, bet.points ]
    end
  end
end