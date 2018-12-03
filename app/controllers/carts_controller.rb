class CartsController < ApplicationController

  def show
    @cart = current_cart
    @items = current_cart.cart_items
  end

  def order_detail
    @user = current_user
    @order = Order.new
    @items = current_cart.cart_items
    @total = 0
    @items.each do |i|
      @total = @total + i.quantity * i.product.item.price
    end
  end

end
