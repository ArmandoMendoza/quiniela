class AddColumnPointsToBets < ActiveRecord::Migration
  def change
    add_column :bets, :points, :integer, default: 0
  end
end
