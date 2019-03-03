class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.datetime :start_time, null: false
      t.integer :duration, null: false

      t.timestamps
    end
    add_index :rounds, :start_time
  end
end
