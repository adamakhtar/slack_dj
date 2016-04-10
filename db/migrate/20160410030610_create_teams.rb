class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :slack_id

      t.timestamps
    end
    add_index :teams, :slack_id
  end
end
