class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :local
      t.integer :visitor
      t.string :match_time
      t.boolean :completed
      t.references :user, index: true
      t.references :pool, index: true
      t.references :match, index: true

      t.timestamps
    end
  end
end
