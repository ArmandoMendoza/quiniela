class CreatePoolsEliminationMatchesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :elimination_matches, :pools do |t|
      t.index [:elimination_match_id, :pool_id], name: :elimination_pool_index
    end
  end
end
