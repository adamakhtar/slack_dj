class AddPositionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :position, :integer
    add_index :users, :position
  end
end
