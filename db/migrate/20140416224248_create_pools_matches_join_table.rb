class CreatePoolsMatchesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :matches, :pools do |t|
      t.index [:match_id, :pool_id]
      # t.index [:pool_id, :match_id]
    end
  end
end
