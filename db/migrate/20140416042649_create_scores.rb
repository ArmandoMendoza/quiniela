class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :local, default: nil
      t.integer :visitor, default: nil
      t.string :match_time, default: nil
      t.references :match, index: true

      t.timestamps
    end
  end
end
