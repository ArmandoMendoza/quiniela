require 'spec_helper'

describe Group do
  it { should have_many(:teams) }
  it { should have_many(:matches) }

  describe "instance methods" do
    describe "classification table" do
      it "should return a hash with the classification data of teams of Group" do
        group = Group.make!
        argentina = Team.make!(name: "Argentina", abbr: "arg", group: group)
        brazil = Team.make!(name: "Brazil", abbr: "bra", group: group)
        chile = Team.make!(name: "Chile", abbr: "chi", group: group)
        argentina_brazil = Match.make!(local_team_id: argentina.id, visitor_team_id: brazil.id,
         group_id: group.id)
        chile_brazil = Match.make!(local_team_id: chile.id, visitor_team_id: brazil.id,
         group_id: group.id)
        chile_argentina = Match.make!(local_team_id: chile.id, visitor_team_id: argentina.id,
         group_id: group.id)
        Score.make!(match: argentina_brazil, local: 3, visitor: 2)
        Score.make!(match: chile_brazil, local: 1, visitor: 2)
        Score.make!(match: chile_argentina, local: 4, visitor: 1)
        expect(group.classification_table).to eq([])
      end
    end
  end
end
