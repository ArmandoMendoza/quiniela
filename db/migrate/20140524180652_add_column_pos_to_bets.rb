class AddColumnPosToBets < ActiveRecord::Migration
  def change
    add_column :bets, :pos, :integer
  end
end
