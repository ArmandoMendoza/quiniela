require 'spec_helper'

describe Pool do
  it { should have_and_belong_to_many(:matches) }
  it { should have_many(:bets) }
end
