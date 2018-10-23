class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.order_items
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.sn = Time.now.to_i
    @order.add_order_items(current_cart)
    @order.amount = current_cart.subtotal

    if @order.save
      current_cart.destroy
      session.delete(:new_order_data)
      #UserMailer.notify_order_create(@order).devliver_now!
      redirect_to orders_path, notice: "new order created"
    else
      @items = current_cart.cart_items
      render "carts/show"
    end
  end

  def checkout_spgateway
    @order = current_user.orders.find(params[:id])
    if @order.payment_status != "not_paid"
      flash[:alert] = "Order has been paid."
      redirect_to orders_path
    else
      @payment = Payment.create!(
        sn: Time.now.to_i,
        order_id: @order.id,
        payment_method: params[:payment_method],
        amount: @order.amount
      )

      render layout: false
    end

  end

   private

  def order_params
    params.require(:order).permit(:name, :phone, :address, :payment_method)
  end

end
