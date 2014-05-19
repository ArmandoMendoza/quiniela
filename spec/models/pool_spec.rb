require 'spec_helper'

describe Pool do
  it { should have_and_belong_to_many(:matches) }
  it { should have_many(:bets) }
  it { should have_many(:answers) }
  it { should have_many(:registers) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:end_date) }
end
