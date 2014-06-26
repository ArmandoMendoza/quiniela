class AddColumnActiveEliminationToPools < ActiveRecord::Migration
  def change
    add_column :pools, :active_elimination, :boolean, default: false
  end
end
