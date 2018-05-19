require 'spec_helper'

describe 'User Resource', type: :feature do
  before do
    @admin = User.make!(:admin)
    3.times { User.make!(:regular) }
  end

  describe "index" do
    it "should show all the user data in a table" do
      login(@admin)
      visit users_path
      within('table') do
        User.all.each do |user|
          expect(page).to have_content(user.name)
        end
      end
    end
  end

  describe "show" do
    pending
  end

  describe "new/create" do
    it "should show a form to create a new user" do
      login(@admin)
      visit new_user_path
      within("form") do
        fill_in "user_name", with: "User"
        fill_in "user_last_name", with: "Test"
        fill_in "user_email", with: "usertest@app.com"
        fill_in "user_phone", with: "0276-353540"
        select "regular", from: "user_role"
        fill_in "user_password", with: "12345678"
        fill_in "user_password_confirmation", with: "12345678"
        click_submit_button
        expect(User.last.name).to eq("User")
        expect(User.last.last_name).to eq("Test")
      end
    end
  end

  describe "edit/update" do
    it "should show a form to edit a select user" do
      user = User.last
      login(@admin)
      visit edit_user_path(user)
      within("form") do
        fill_in "user_name", with: "User Test"
        fill_in "user_email", with: "usertest@app.com"
        click_submit_button
        user.reload
        expect(user.name).to eq("User Test")
        expect(user.email).to eq("usertest@app.com")
      end
    end
  end

  describe "delete" do
    it "should destroy a user" do
      login(@admin)
      visit users_path
      expect { click_delete_link(user_path(User.first)) }.to change(User, :count).by(-1)
    end
  end

  describe "bets/create_bets" do
    describe "when exists a pools active" do
      it "should create a bets to user from a pool selected" do
        login(@admin)
        pool = Pool.make!
        user = User.last
        visit bets_user_path(user)
        within('form') do
          select pool.name, from: "pool_id"
          click_submit_button
        end
        user.reload
        expect(page.current_path).to eq(user_path(user))
        expect(user).to have(pool.matches.size).bets
      end
    end

    describe "when not exists a pools active" do
      it "should redirect to users index" do
        login(@admin)
        user = User.last
        visit bets_user_path(user)
        expect(page.current_path).to eq(users_path)
        expect(page).to have_content('No hay Quinielas activas')
      end
    end
  end
end