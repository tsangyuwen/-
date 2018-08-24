class RenameShippintStatusToOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :shippint_status, :shipping_status
  end
end
