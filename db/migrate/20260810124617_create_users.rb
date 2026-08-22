class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :tc_no, null: false
      t.string :phone_no, null: false
      t.text :address, null: false
      t.string :email, null: false

      t.timestamps
    end
    add_index :users, :tc_no, unique: true
    add_index :users, :phone_no, unique: true
    add_index :users, :email, unique: true
  end
end
