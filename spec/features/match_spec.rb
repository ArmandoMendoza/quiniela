require 'spec_helper'

describe 'Match Resource' do
  before do
    @admin = User.make!(:admin)
    3.times { Match.make! }
  end

  describe "index" do
    it "should show all the match data in a table" do
      login(@admin)
      visit matches_path
      within('table') do
        Match.all.each do |match|
          expect(page).to have_content(match.to_s)
        end
      end
    end
  end

  describe "show" do
    pending
  end

  describe "new/create" do
    it "should show a form to create a new match" do
      argentina = Team.make!(name: "Argentina")
      brazil = Team.make!(name: "Brazil")
      login(@admin)
      visit new_match_path
      within("form") do
        fill_in "match_date", with: "2014-01-01"
        fill_in "match_stadium", with: "Pueblo Nuevo"
        select argentina.name, from: "match_local_team_id"
        select brazil.name, from: "match_visitor_team_id"
        click_submit_button
        expect(Match.last.to_s).to eq("Argentina vs Brazil")
      end
    end
  end

  describe "edit/update" do
    it "should show a form to edit a select match" do
      match = Match.last
      login(@admin)
      visit edit_match_path(match)
      within("form") do
        fill_in "match_date", with: "2014-12-31"
        fill_in "match_stadium", with: "Maracana"
        click_submit_button
        match.reload
        expect(match.date.strftime('%Y-%m-%d')).to eq("2014-12-31")
        expect(match.stadium).to eq("Maracana")
      end
    end
  end

  describe "delete" do
    it "should destroy a match" do
      login(@admin)
      visit matches_path
      expect { click_delete_link(match_path(Match.first)) }.to change(Match, :count).by(-1)
    end
  end
end