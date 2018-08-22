class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :shippint_status, default: "not_shipped"
      t.integer :amount
      t.integer :sn
      t.string :phone
      t.string :name
      t.string :payment_status, default: "not_paid"
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
