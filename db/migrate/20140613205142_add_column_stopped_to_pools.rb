class AddColumnStoppedToPools < ActiveRecord::Migration
  def change
    add_column :pools, :stopped, :boolean, default: false
  end
end
