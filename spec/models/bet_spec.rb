require 'spec_helper'

describe Bet do
  it { should belong_to(:user) }
  it { should belong_to(:pool) }
  it { should belong_to(:match) }
  it { should validate_presence_of(:visitor).on(:update) }
  it { should validate_presence_of(:local).on(:update) }
  it { should validate_presence_of(:match_time).on(:update) }

  describe "class methods" do
    describe "create_all_bets_for" do
      it "creates one bet for a given user per each match in a given pool " do
        user = User.make!(:regular)
        pool = Pool.make!
        matches = pool.matches
        Bet.create_all_bets_for(user, pool)
        expect(user).to have(matches.size).bets
      end
      it "don't creates a bet that exists" do
        user = User.make!(:regular)
        pool = Pool.make!
        matches = pool.matches
        Bet.create_all_bets_for(user, pool)
        Bet.create_all_bets_for(user, pool)
        expect(user).to have(matches.size).bets
      end
    end
  end

  describe "instance methods" do
    describe "#points" do
      describe "bet with a match without score" do
        it "should return 0" do
          match = Match.make! #without score ergo without result
          bet = Bet.make!(match: match)
          expect(bet.points).to eq(0)
        end
      end
      describe "bet with a match with score" do
        describe "bet's result is equal to result of final score of match" do
          it "should return 1" do
            ## bet a winner
            score = Score.make!(local: 3, visitor: 1)
            match = Match.make!(scores: [score])
            bet = Bet.make!(match: match, local: 2, visitor: 1)
            expect(bet.points).to eq(1)
            ## bet a draw
            score = Score.make!(local: 1, visitor: 1)
            match = Match.make!(scores: [score])
            bet = Bet.make!(match: match, local: 1, visitor: 1)
            expect(bet.points).to eq(1)
          end
        end
        describe "the bet's score is equal to match's score and is not a draw" do
          it "should return 3" do
            ## bet a winner and score
            score = Score.make!(local: 3, visitor: 1)
            match = Match.make!(scores: [score])
            bet = Bet.make!(match: match, local: 3, visitor: 1)
            expect(bet.points).to eq(3)
          end
        end
      end
    end
  end
end
