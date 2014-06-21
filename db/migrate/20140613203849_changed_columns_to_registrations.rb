class ChangedColumnsToRegistrations < ActiveRecord::Migration
  def change
    add_column(:registrations, :last_name, :string)
    remove_column(:registrations, :comments)
  end
end
