class AddTeamIdToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :team_id, :integer
    add_index :players, :team_id
  end
end
