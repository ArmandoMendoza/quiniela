class AddColumnGroupIdToMatches < ActiveRecord::Migration
  def change
    add_reference :matches, :group, index: true
  end
end
