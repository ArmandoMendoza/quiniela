class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :local, default: nil
      t.integer :visitor, default: nil
      t.string :match_time, default: nil
      t.boolean :completed, default: false
      t.references :user, index: true
      t.references :pool, index: true
      t.references :match, index: true

      t.timestamps
    end
  end
end
