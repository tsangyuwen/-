class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :intro
      t.string :main_image
      t.integer :price, null: false

      t.timestamps
    end
  end
end
