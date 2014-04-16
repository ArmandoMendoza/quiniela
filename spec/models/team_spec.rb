require 'spec_helper'

describe Team do
  it { should belong_to(:group) }
end
