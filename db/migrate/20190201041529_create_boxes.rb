class CreateBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :boxes do |t|
      t.references :round, foreign_key: true, null: false

      t.timestamps
    end
  end
end
