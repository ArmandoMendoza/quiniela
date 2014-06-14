class MyBetsPdf < Prawn::Document

  def initialize(pool, bets, user)
    super()
    @pool = pool
    @bets = bets.order(['matches.group_id', 'bets.pos'])
    @user = user
    header
    body
  end

  def header
    text @pool.name
    text @user.name
  end

  def body
    move_down 20
    table rows
  end

  def rows
    [["id","Grupo", "Partido", "Apuesta", "Resultado", "Puntos"]] +
    @bets.map do |bet|
      bet.match.get_teams
      [bet.id, bet.match.group.name, bet.match.to_s, bet.to_s, bet.match.final_score.to_s, bet.points]
    end
  end
end