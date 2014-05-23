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
        armando = mock_model(User, name: "Armando")
        allow(armando).to receive(:total_points_in_pool).with(an_instance_of(Pool)) { 20 }
        camilo = mock_model(User, name: "Cami")
        allow(camilo).to receive(:total_points_in_pool).with(an_instance_of(Pool)) { 31 }
        federico = mock_model(User, name: "Fede")
        allow(federico).to receive(:total_points_in_pool).with(an_instance_of(Pool)) { 15 }
        rafael = mock_model(User, name: "Chino")
        allow(rafael).to receive(:total_points_in_pool).with(an_instance_of(Pool)) { 30 }
        Pool.any_instance.stub(:users).and_return([federico, camilo, armando, rafael])
        pool = Pool.make!
        expect(armando.total_points_in_pool(pool)).to eq(20)
        expect(pool.users).to have(4).users
        expect(pool.users_classification).to eq( {"Cami" => 31 , "Chino" => 30,
          "Armando" => 20, "Fede" => 15} )
      end
    end
  end
end
