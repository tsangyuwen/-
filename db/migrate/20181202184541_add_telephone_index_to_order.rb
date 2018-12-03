class AddTelephoneIndexToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :telephone_2, :string
    add_column :orders, :telephone_3, :string
  end
end
