class AddColumnRoundToEliminationMatches < ActiveRecord::Migration
  def change
    add_column :elimination_matches, :round, :string
  end
end
