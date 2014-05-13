require 'spec_helper'

describe 'Bet Resource' do
  # before do
  #   @admin = User.make!(:admin)
  #   @pool = Pool.make!
  #   @user = User.make!(:regular)
  #   @user.create_bets_from(@pool)
  #   @other_user = User.make!(:regular)
  #   @other_user.create_bets_from(@pool)
  # end

  # describe "index" do
  #   describe "login as regular user" do
  #     it "should show only bets of user in a table" do
  #       login(@user)
  #       visit bets_path
  #       within('table') do
  #         @user.bets.each do |bet|
  #           expect(page).to have_content(bet.match.to_s)
  #         end
  #         # @other_user.bets.each do |bet|
  #         #   expect(page).to_not have_content(bet.match.to_s)
  #         # end
  #       end
  #     end
  #   end

  #   describe "login as admin user" do
  #     it "should show all bets in a table" do
  #       login(@admin)
  #       visit bets_path
  #       within('table') do
  #         Bet.all.each do |bet|
  #           expect(page).to have_content(bet.match.to_s)
  #         end
  #       end
  #     end
  #   end
  # end

  # describe "edit/update" do
  #   ## admin can edit a bet. but is good that admin can edit a bet?

  #   describe "login as regular user" do
  #     it "should only edit his own bets" do
  #       bet = @user.bets.first
  #       login(@user)
  #       visit edit_bet_path(bet)
  #       within("form") do
  #         fill_in "bet_local", with: "1"
  #         fill_in "bet_visitor", with: "3"
  #         select "Partido", from: "bet_match_time"
  #         click_submit_button
  #         bet.reload
  #         expect(bet.local).to eq(1)
  #         expect(bet.visitor).to eq(3)
  #         expect(bet.match_time).to eq("full-time")
  #         expect(bet).to be_completed
  #       end
  #     end

  #     it "should not edit a bet of another user" do
  #       bet = @other_user.bets.first
  #       login(@user)
  #       expect { visit edit_bet_path(bet) }.to raise_error(CanCan::AccessDenied)
  #     end
  #   end
  # end

  # describe "delete" do
  #   it "should destroy a bet" do
  #     login(@admin)
  #     visit bets_path
  #     expect { click_delete_link(bet_path(Bet.first)) }.to change(Bet, :count).by(-1)
  #   end
  # end
end