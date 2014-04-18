require 'spec_helper'

describe Match do
  it { should have_many(:scores) }
  it { should have_many(:bets) }
  it { should have_and_belong_to_many(:pools) }
end
