class AddWhereToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :where, :string
  end
end
