class ChangeTableMatches < ActiveRecord::Migration
  def change
    add_column :matches, :hour, :string
    change_column :matches, :date, :date
  end
end
