class AddTelephoneToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :telephone, :string
    add_column :orders, :payment_select, :string
  end
end
