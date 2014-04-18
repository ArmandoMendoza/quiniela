require 'spec_helper'

describe Score do
  it { should belong_to(:match) }
  it { should validate_presence_of(:local) }
  it { should validate_presence_of(:visitor) }
  it { should validate_presence_of(:match_time) }

  describe "instance methods" do
    describe "#result" do
      it "it return a result using words local, visitor or draw" do
        score = Score.make!(local: 1, visitor: 0)
        expect(score.result).to eq("local")
        score = Score.make!(local: 0, visitor: 1)
        expect(score.result).to eq("visitor")
        score = Score.make!(local: 0, visitor: 0)
        expect(score.result).to eq("draw")
      end
    end
  end
end
