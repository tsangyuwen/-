class Ajion2596dhi::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]
  
  def index
    @orders = Order.all
  end

  def update
    if @order.update(order_params)
      flash[:notice] = "success"
      redirect_to ajion2596dhi_orders_path
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to ajion2596dhi_orders_path
    flash[:alert] = "order was deleted"
  end

  private 

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:shipping_status, :payment_status, :address, :name, :phone, :telephone, :telephone_2, :telephone_3, :tax_id)
  end
end
