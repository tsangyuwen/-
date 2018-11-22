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
  end
end