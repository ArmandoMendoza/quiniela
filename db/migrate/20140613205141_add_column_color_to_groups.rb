class AddColumnColorToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :color, :string, default: "#FFF"
  end
end
