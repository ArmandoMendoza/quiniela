class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :comments
      t.references :pool, index: true

      t.timestamps
    end
  end
end
