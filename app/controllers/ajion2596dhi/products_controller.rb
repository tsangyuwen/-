class Ajion2596dhi::ProductsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    @product = Product.new(product_params)
    @product.item_id = item.id
    @product.save!
    redirect_to ajion2596dhi_item_path(item)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "success"
      redirect_to ajion2596dhi_item_path(@product.item)
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to ajion2596dhi_item_path(@product.item)
    flash[:alert] = "product was deleted"
  end

  private

  def product_params
    params.require(:product).permit(:size, :color, :image, :stock, :item_id)
  end
end
