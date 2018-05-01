require 'spec_helper'

describe 'Home', type: :feature do
  describe "index" do
    it "should show form for registration" do
      visit root_path
      within('form#new_registration') do
        expect(page).to have_selector('#registration_nickname')
        expect(page).to have_selector('#registration_name')
        expect(page).to have_selector('#registration_phone')
        expect(page).to have_selector('#registration_email')
      end
    end

    it "should create a new registration" do
      pool = Pool.make!
      visit root_path
      expect do
        fill_in "registration_nickname", with: "Batman"
        fill_in "registration_name", with: "Bruce"
        fill_in "registration_last_name", with: "Wayne"
        fill_in "registration_phone", with: "500-228626"
        fill_in "registration_email", with: "soybatman@batman.com"
        select pool.name, from: "registration_pool_id"
        click_button "HACER RESERVA"
      end.to change(Registration, :count).by(1)
    end

    it "should show form for contact" do
      visit root_path
      within('form#new_contact') do
        expect(page).to have_selector('#contact_name')
        expect(page).to have_selector('#contact_email')
        expect(page).to have_selector('#contact_message')
      end
    end
  end
end