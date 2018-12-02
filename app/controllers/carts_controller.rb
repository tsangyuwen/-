class CartsController < ApplicationController

  def show
    @cart = current_cart
    @items = current_cart.cart_items
  end

  def order_detail
    @user = current_user
    @order = Order.new
  end

end
