require 'spec_helper'

describe Match do
  it { should have_many(:scores) }
  it { should have_many(:bets) }
  it { should have_and_belong_to_many(:pools) }
  it { should validate_presence_of(:stadium) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:visitor_team_id) }
  it { should validate_presence_of(:local_team_id) }
end
