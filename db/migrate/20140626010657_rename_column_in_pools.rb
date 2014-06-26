class RenameColumnInPools < ActiveRecord::Migration
  def change
    rename_column :pools, :stopped, :active_clasification
  end
end
