class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :status, default: 'stopped', null: false

      t.timestamps
    end

    add_index :players, :status
  end
end
