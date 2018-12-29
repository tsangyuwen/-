class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user

  def add_cart_item(product, quantity)
    existing_item = self.cart_items.find_by(product: product)
    if existing_item
      existing_item.quantity += quantity
      existing_item.save!
    else
      cart_item = cart_items.build(product: product, quantity: quantity)
      cart_item.save!
    end
    self.cart_items
  end

  def subtotal
    cart_items.map{ |x| x.item_total }.sum
  end

  def find_item_by(product)
    self.cart_item.where(product_id: product).first
  end
end
