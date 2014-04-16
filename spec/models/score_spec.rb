require 'spec_helper'

describe Score do
  it { should belong_to(:match) }
end
