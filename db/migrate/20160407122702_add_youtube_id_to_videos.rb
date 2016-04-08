class AddYoutubeIdToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :youtube_id, :string
    add_index :videos, :youtube_id
  end
end
