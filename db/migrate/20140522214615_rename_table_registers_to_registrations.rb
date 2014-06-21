class RenameTableRegistersToRegistrations < ActiveRecord::Migration
  def change
    rename_table :registers, :registrations
  end
end
