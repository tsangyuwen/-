class ChangeProductAndProductItems < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :size, :string
    add_column :products, :color, :string
    add_column :products, :image, :string
    add_column :products, :stock, :string
    add_column :products, :product_item_id, :int
    remove_column :products, :name
    remove_column :products, :main_image
    remove_column :products, :intro
    remove_column :products, :price
    remove_column :products, :category_id
    add_column :product_items, :name, :string
    add_column :product_items, :main_image, :string
    add_column :product_items, :intro, :string
    add_column :product_items, :price, :int
    add_column :product_items, :category_id, :int
    remove_column :product_items, :size
    remove_column :product_items, :color
    remove_column :product_items, :image
    remove_column :product_items, :stock
    remove_column :product_items, :product_id
  end
end