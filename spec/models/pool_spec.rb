require 'spec_helper'

describe Pool do
  it { should have_and_belong_to_many(:matches) }
  it { should have_many(:bets) }
  it { should have_many(:answers) }
  it { should have_many(:registrations) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:end_date) }

  describe "instance methods" do
    describe "#users_classification" do
      it "should return an array of active users of pool ordered by total points in pool" do
        users = {"armando" => 20, "camilo" => 31, "federico" => 15, "rafael" => 30}
        mocks = {}
        users.each do |name, points|
          mocks[name] = mock_model(User, nickname: name)
          allow(mocks[name]).to receive(:total_points_in_pool).with(an_instance_of(Pool)) { points }
        end
        Pool.any_instance.stub(:users).and_return([mocks["federico"], mocks["camilo"],
          mocks["armando"], mocks["rafael"]])
        pool = Pool.make!
        expect(pool.users_classification).to eq( {"camilo" => 31 , "rafael" => 30,
          "armando" => 20, "federico" => 15} )
      end
    end
  end

  describe "class method" do
    describe "active_for_user" do
      it "return of all pool without pools of user" do
        array_pool = []
        4.times { array_pool << Pool.make! }
        pool = Pool.make!
        user = User.make!(:regular)
        Bet.make!(user: user, pool: pool, match: pool.matches.first)
        expect(Pool.active_for_user(user)).to eq(array_pool)
      end
    end
  end
end
