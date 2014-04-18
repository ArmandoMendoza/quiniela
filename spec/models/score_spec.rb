require 'spec_helper'

describe Score do
  it { should belong_to(:match) }
  it { should validate_presence_of(:local) }
  it { should validate_presence_of(:visitor) }
  it { should validate_presence_of(:match_time) }
end
