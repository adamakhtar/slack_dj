class AssociateWithTeamsInsteadOfUsersOnPlaylists < ActiveRecord::Migration[5.0]
  def up
    rename_column :playlists, :user_id, :team_id
  end

  def down
    rename_column :playlists, :team_id, :user_id
  end
end
