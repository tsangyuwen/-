class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string "who"
      t.string "name"

      t.timestamps
    end

    change_column :products, :intro, :text
  end
end
