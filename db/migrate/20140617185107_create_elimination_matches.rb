class CreateEliminationMatches < ActiveRecord::Migration
  def change
    create_table :elimination_matches do |t|
      t.date :date
      t.string :hour
      t.string :stadium
      t.integer :local_team_id
      t.integer :visitor_team_id
      t.integer :visitor
      t.integer :local
      t.string :match_number
      t.timestamps
    end
  end
end
