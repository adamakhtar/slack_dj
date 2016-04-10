class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :slack_id
      t.string :name

      t.timestamps
    end
  end
end
