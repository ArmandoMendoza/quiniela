class RenameAndAddColumnsInEliminationMatches < ActiveRecord::Migration
  def change
    rename_column :elimination_matches, :next_match, :match_to_winner
    add_column :elimination_matches, :match_to_loser, :integer
  end
end
