class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :name
      t.date :end_date
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
