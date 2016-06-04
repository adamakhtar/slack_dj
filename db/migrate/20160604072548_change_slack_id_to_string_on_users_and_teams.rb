class ChangeSlackIdToStringOnUsersAndTeams < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :slack_id, :string
    change_column :teams, :slack_id, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
