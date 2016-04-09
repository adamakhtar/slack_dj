class AddVideoIdToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :video_id, :integer
    add_index :players, :video_id
  end
end
