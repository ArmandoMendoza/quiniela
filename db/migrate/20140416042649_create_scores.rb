class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :local
      t.integer :visitor
      t.string :match_time
      t.references :match, index: true

      t.timestamps
    end
  end
end
