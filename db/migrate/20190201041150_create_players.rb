class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false
      t.string :phone
      t.string :password_digest
      t.boolean :active, default: true
      t.string :preferred_contact, default: ''
      t.string :notes, default: ''
      t.boolean :admin, default: false

      t.timestamps
    end
    add_index :players, [:first_name, :email]
  end
end
