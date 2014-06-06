class AddColumnPotPercentageToPools < ActiveRecord::Migration
  def change
    add_column :pools, :pot_percentage, :float
  end
end
