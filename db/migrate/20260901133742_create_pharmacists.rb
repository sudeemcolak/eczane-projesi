class CreatePharmacists < ActiveRecord::Migration[8.1]
  def change
    create_table :pharmacists do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.string :password_digest
      t.references :drugstore, null: false, foreign_key: true

      t.timestamps
    end
  end
end
