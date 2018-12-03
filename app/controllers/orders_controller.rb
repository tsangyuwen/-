class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.order_items
  end

  def create
    @user = current_user
    @items = current_cart.cart_items
    total = 0
    @items.each do |i|
      total = total + i.quantity * i.product.item.price
    end

    @order = current_user.orders.new(order_params)
    @order.address = params[:zipcode] + params[:county] + params[:district] + order_params[:address]
    @order.amount = total
    @order.sn = Time.now.to_i
    @order.add_order_items(current_cart)

    if @order.save
      redirect_to select_payment_orders_path
    else
      flash.now[:alert] = "資料尚未填寫完成，請檢查"
      render :template => 'carts/order_detail'
    end
  end

  def select_payment
    @order = current_user.orders.last
    @items = current_cart.cart_items
    @total = 0
    @items.each do |i|
      @total = @total + i.quantity * i.product.item.price
    end
  end

  def create_order
    @order = current_user.orders.last
    puts params[:select]
    @order.payment_select = params[:select]
    if @order.save
      current_cart.destroy
    else
      flash.now[:alert] = "請選擇付款方式"
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
        payment_method: "Credit",
        amount: @order.amount
      )

      render layout: false
    end

  end

   private

  def order_params
    params.require(:order).permit(:address, :name, :phone, :telephone, :telephone_2, :telephone_3, :tax_id)
  end

end
