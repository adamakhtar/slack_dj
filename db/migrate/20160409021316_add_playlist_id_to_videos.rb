class AddPlaylistIdToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :playlist_id, :integer
    add_index :videos, :playlist_id
  end
end
