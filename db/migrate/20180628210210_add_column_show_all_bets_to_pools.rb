class AddColumnShowAllBetsToPools < ActiveRecord::Migration
  def change
    add_column :pools, :show_all_bets, :boolean, default: true
  end
end
