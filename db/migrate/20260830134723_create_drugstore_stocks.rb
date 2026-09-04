class CreateDrugstoreStocks < ActiveRecord::Migration[8.1]
  def change
    create_table :drugstore_stocks do |t|
      t.string :medicine
      t.integer :stock
      t.decimal :price
      t.references :drugstore, null: false, foreign_key: true

      t.timestamps
    end
  end
end
