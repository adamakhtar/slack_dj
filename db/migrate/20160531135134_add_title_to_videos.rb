class AddTitleToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :title, :string
  end
end
