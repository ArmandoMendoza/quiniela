require 'spec_helper'

describe User do
  it { should have_many(:bets) }
  it { should have_many(:elimination_bets) }
  it { should have_many(:answers)}

  describe "Callbacks" do
    describe "#set_nickname" do
      it "should set a nickname from the name if nickname is not set" do
        user = User.make(:regular, name: "Armando", last_name: "Mendoza", nickname: nil)
        user.save
        expect(user.nickname).to eq("armando_mendoza")
      end
    end
  end

  describe "instance methods" do
    describe "#total_points_in_pool" do
      it "return the total bet's points of user in a given pool" do
        user = User.make!(:regular)
        pool = Pool.make!
        matches = pool.matches
        matches.each do |match|
          #user bet that all matches will be draw 1-1
          Bet.make!(visitor: 1, local: 1, user: user, pool: pool, match: match)
        end
        matches.each do |match|
          #all matchesr ended in draw
          Score.make!(match: match, visitor: 1, local: 1)
        end
        ## then the user have a 5*3 points in total in pool
        expect(user.total_points_in_pool(pool)).to eq(15)
      end
    end

    describe "#last_active_pool" do
      it "return the last updated active pool of user" do
        pool_one = Pool.make!
        pool_two = Pool.make!
        pool_three = Pool.make!
        user = User.make!(:regular)
        user.create_bets_from(pool_one)
        user.create_bets_from(pool_two)
        user.create_bets_from(pool_three)
        user.reload
        expect(user.last_active_pool).to eq(pool_three)
      end
    end
  end
end
