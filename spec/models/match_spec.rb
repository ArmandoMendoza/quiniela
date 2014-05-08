require 'spec_helper'

describe Match do
  it { should belong_to(:group) }
  it { should have_many(:scores) }
  it { should have_many(:bets) }
  it { should have_and_belong_to_many(:pools) }
  it { should validate_presence_of(:stadium) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:visitor_team_id) }
  it { should validate_presence_of(:local_team_id) }

  describe "validaciones" do
    it "should not permit a match with the same team" do
      team = Team.make!
      match = Match.make(local_team_id: team.id, visitor_team_id: team.id)
      expect(match).to_not be_valid
      expect(match).to have(1).error
    end
  end
end
