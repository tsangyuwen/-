class AddTaxIdToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :tax_id, :string
  end
end
