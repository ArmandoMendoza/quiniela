class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :abbr
      t.integer :pos
      t.references :group, index: true

      t.timestamps
    end
  end
end
