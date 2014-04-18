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
end
