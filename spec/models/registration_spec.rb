require 'spec_helper'

describe Registration do
  it { should belong_to(:pool) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:pool_id) }
end
