class CreateOrderItems < ActiveRecord::Migration[8.1]
  def change
    
    create_table :order_items do |t|
      t.integer :order_id
      t.string :medicine
      t.string :status

      t.timestamps
    end
  end
end
