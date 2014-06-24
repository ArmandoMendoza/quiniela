class AddColumnsToEliminationMatch < ActiveRecord::Migration
  def change
    add_column :elimination_matches, :next_match, :integer
    add_column :elimination_matches, :select, :string
  end
end
