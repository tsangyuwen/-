class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string "name"
      t.string "main_image"
      t.string "intro"
      t.integer "price"
      t.integer "category_id"

      t.timestamps
    end

    rename_column :products, :product_item_id, :item_id
  end
end
