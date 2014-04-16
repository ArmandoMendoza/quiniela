class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :date
      t.string :stadium
      t.integer :local_team_id, index: true
      t.integer :visitor_team_id, index: true

      t.timestamps
    end
  end
end
