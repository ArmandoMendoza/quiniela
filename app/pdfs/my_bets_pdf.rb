class MyBetsPdf < Prawn::Document

  def initialize(pool, bets, user)
    super()
    @pool = pool
    @bets = bets
    header
  end

  def header
    text @pool.name
    text user.name
  end
end