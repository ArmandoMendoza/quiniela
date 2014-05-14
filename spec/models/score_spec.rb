require 'spec_helper'

describe Score do
  it { should belong_to(:match) }
  it { should validate_presence_of(:local) }
  it { should validate_presence_of(:visitor) }
  it { should validate_presence_of(:match_time) }

  describe "callbacks" do
    describe "check_bets_of_match" do
      it "should calculate the points of all bets of match" do
        user = User.make!(:regular)
        pool = Pool.make!
        matches = pool.matches
        match = matches.first
        bet = Bet.make!(local: 1, visitor: 3, user: user, pool: pool, match: match)
        expect(bet.points).to eq(0)
        # create an score to match eq to bet
        score = Score.make(match: match, local: 1, visitor: 3)
        score.save
        bet.reload
        expect(bet.points).to eq(3)
      end
    end
  end

  describe "instance methods" do
    describe "#result" do
      it "it return a result using words local, visitor or draw" do
        score = Score.make!(local: 1, visitor: 0)
        expect(score.result).to eq("local")
        score = Score.make!(local: 0, visitor: 1)
        expect(score.result).to eq("visitor")
        score = Score.make!(local: 0, visitor: 0)
        expect(score.result).to eq("draw")
      end
    end
  end
end
