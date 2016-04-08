class AddPlayedAtToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :played_at, :datetime
  end
end
