class AddColumnNickNameToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :nickname, :string
  end
end
