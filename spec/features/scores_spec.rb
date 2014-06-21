require 'spec_helper'

describe 'Score Resource' do
  before do
    @admin = User.make!(:admin)
    @score = Score.make!
    @match = @score.match
  end

  describe "index" do
    it "should show all the scores of match in a table" do
      login(@admin)
      visit match_scores_path(@match)
      within('table') do
        @match.scores.all.each do |score|
          expect(page).to have_content(score.match_time)
        end
      end
    end
  end

  describe "show" do
    pending
  end

  describe "new/create" do
    it "should show a form to create a new score" do
      login(@admin)
      visit new_match_score_path(@match)
      within("form") do
        fill_in "score_local", with: "0"
        fill_in "score_visitor", with: "3"
        select 'Prorroga', from: "score_match_time"
        click_submit_button
        expect(Score.last.visitor).to eq(3)
        expect(Score.last.match_time).to eq("aggregate")
      end
    end
  end

  describe "edit/update" do
    it "should show a form to edit a select score" do
      score = Score.last
      login(@admin)
      visit edit_match_score_path(@match, score)
      within("form") do
        fill_in "score_local", with: "2"
        click_submit_button
        score.reload
        expect(Score.last.local).to eq(2)
      end
    end
  end

  describe "delete" do
    it "should destroy a score" do
      login(@admin)
      visit match_scores_path(@match)
      expect do
        click_delete_link(match_score_path(@match, Score.last))
      end.to change(Score, :count).by(-1)
    end
  end
end