class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :phone
      t.string :website

      t.timestamps
    end
    add_index :venues, :name
  end
end
