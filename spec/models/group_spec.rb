require 'spec_helper'

describe Group do
  it { should have_many(:teams) }
  it { should have_many(:matches) }
end
