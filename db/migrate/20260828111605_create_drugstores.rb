class CreateDrugstores < ActiveRecord::Migration[8.1]
  def change
    create_table :drugstores do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
