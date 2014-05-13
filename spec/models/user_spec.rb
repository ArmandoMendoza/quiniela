require 'spec_helper'

describe User do
  it { should have_many(:bets) }

  describe "instance methods" do
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
