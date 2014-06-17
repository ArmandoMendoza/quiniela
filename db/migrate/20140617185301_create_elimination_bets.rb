class CreateEliminationBets < ActiveRecord::Migration
  def change
    create_table :elimination_bets do |t|
      t.integer  :local
      t.integer  :visitor
      t.string   :local_name
      t.string   :visitor_name
      t.integer  :user_id
      t.integer  :pool_id
      t.integer  :elimination_match_id
      t.boolean  :completed, default: false
      t.integer  :points, default: 0
      t.integer  :pos
      t.timestamps
    end
  end
end
