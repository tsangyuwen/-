class AddQuantityToProductItem < ActiveRecord::Migration[5.1]
  def change
    add_column :product_items, :stock, :int
  end
end
