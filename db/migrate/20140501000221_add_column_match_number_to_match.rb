class AddColumnMatchNumberToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :match_number, :string
  end
end
