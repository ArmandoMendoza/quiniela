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
      it "the bet created should have pos equal to match_number of match" do
        user = User.make!(:regular)
        pool = Pool.make!
        matches = pool.matches
        Bet.create_all_bets_for(user, pool)
        Bet.create_all_bets_for(user, pool)
        bet = user.bets.where(match_id: matches.last.id).first
        expect(bet.pos).to eq(matches.last.match_number.to_i)
      end
    end
  end

  describe "instance methods" do
    describe "#calculate_and_set_points" do
      describe "bet with a match without score" do
        it "should set points to 0" do
          match = Match.make! #without score ergo without result
          bet = Bet.make!(match: match)
          bet.calculate_and_set_points
          bet.reload
          expect(bet.points).to eq(0)
        end
      end
      describe "bet with a match with score" do
        describe "bet's result is equal to result of final score of match" do
          it "should set points to 1" do
            ## bet a winner
            score = Score.make!(local: 3, visitor: 1)
            match = Match.make!(scores: [score])
            bet = Bet.make!(match: match, local: 2, visitor: 1)
            bet.calculate_and_set_points
            bet.reload
            expect(bet.points).to eq(1)
          end
        end
        describe "the bet's score is equal to match's score and is not a draw" do
          it "should set points to 3" do
            ## bet a winner and score
            score = Score.make!(local: 3, visitor: 1)
            match = Match.make!(scores: [score])
            bet = Bet.make!(match: match, local: 3, visitor: 1)
            bet.calculate_and_set_points
            bet.reload
            expect(bet.points).to eq(3)
          end
        end
      end
    end
  end
end
