class AddColumnPriceToPools < ActiveRecord::Migration
  def change
    add_column :pools, :price, :integer
  end
end
