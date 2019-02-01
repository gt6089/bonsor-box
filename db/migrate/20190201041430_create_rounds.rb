class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.date :start_date, null: false
      t.integer :duration, null: false

      t.timestamps
    end
    add_index :rounds, :start_date
  end
end
