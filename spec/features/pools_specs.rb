require 'spec_helper'

describe 'Pool Resource' do
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
    before do
      @user = User.make!(:regular)
    end
    describe "pool belong to user" do
      it "should show a resume of pool" do
        pool = Pool.make!
        pool.matches.each do |m|
          Bet.make!(user: @user, pool: pool, match: m)
        end
        login(@user)
        visit pool_path(@pool)
        expect(current_path).to eq(pool_path(@pool))
      end
    end

    describe "pool don't belong to user" do
      before do
        @pool = Pool.make!
      end
      it "should show a resume of pool" do
        login(@user)
        visit pool_path(@pool)
        expect(current_path).to eq(pool_path(@pool))
      end
    end
  end

  describe "new/create" do
    it "should show a form to create a new pool" do
      3.times { Match.make! }
      Pool.delete_all
      login(@admin)
      visit new_pool_path
      within("form") do
        fill_in "pool_name", with: "Quiniela Test"
        fill_in "pool_end_date", with: "2014-06-31"
        fill_in "pool_price", with: 1000
        select Match.first.to_s, from: "pool_match_ids"
        select Match.last.to_s, from: "pool_match_ids"
        click_submit_button
        expect(Pool.last.name).to eq("Quiniela Test")
        expect(Pool.last).to have(2).matches
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
        pool.reload
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