class CreateScrapes < ActiveRecord::Migration[5.1]
  def change
    create_table :scrapes do |t|
      t.string "title"
      t.string "which"
      t.integer "size"

      t.timestamps
    end
  end
end
