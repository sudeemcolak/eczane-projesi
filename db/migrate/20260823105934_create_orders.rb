class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :recete_id
      t.string :status

      t.timestamps
    end
  end
end
