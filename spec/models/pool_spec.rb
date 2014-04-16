require 'spec_helper'

describe Pool do
  it { have_and_belong_to_many(:matches) }
end
