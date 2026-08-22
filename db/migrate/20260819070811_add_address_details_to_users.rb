class AddAddressDetailsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :city, :string
    add_column :users, :district, :string
    add_column :users, :neighborhood, :string
  end
end
