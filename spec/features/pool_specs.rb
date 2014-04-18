require 'spec_helper'

describe 'User Resource' do
  before do
    @admin = User.make!(:admin)
    3.times { Pool.make! }
  end

  describe "index" do
    it "should show all the pool data in a table" do
      login(@admin)
      visit pools_path
      within('table') do
        Pool.all.each do |pool|
          expect(page).to have_content(pool.name)
        end
      end
    end
  end

  describe "show" do
    pending
  end

  describe "new/create" do
    it "should show a form to create a new pool" do
      3.times { Match.make! }
      login(@admin)
      visit new_pool_path
      within("form") do
        fill_in "pool_name", with: "Quiniela Test"
        select Match.first.to_s, from: "pool_match_ids"
        select Match.last.to_s, from: "pool_match_ids"
        click_submit_button
        expect(Match.last.name).to eq("Quiniela Test")
        expect(Match.last).to have(2).matches
      end
    end
  end

  describe "edit/update" do
    it "should show a form to edit a select pool" do
      pool = Pool.last
      login(@admin)
      visit edit_pool_path(pool)
      within("form") do
        fill_in "pool_name", with: "Super Quiniela"
        click_submit_button
        user.reload
        expect(pool.name).to eq("Super Quiniela")
      end
    end
  end

  describe "delete" do
    it "should destroy a pool" do
      login(@admin)
      visit pools_path
      expect { click_delete_link(pool_path(Pool.first)) }.to change(Pool, :count).by(-1)
    end
  end
end