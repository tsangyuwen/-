class AddAddressToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :tax_id, :string
  end
end
