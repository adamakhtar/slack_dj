class AddUserIdToPlaylists < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :user_id, :integer
    add_index :playlists, :user_id
  end
end
