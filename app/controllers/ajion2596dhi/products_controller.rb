class Ajion2596dhi::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  
  def index
    @items = Item.all
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "success"
      redirect_to ajion2596dhi_root_path
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  def edit_detail
    @product = Product.find(params[:id])
  end

  def update_detail
    @product = Product.find(params[:id])
    if @item.update(product_params)
      flash[:notice] = "success"
      redirect_back(fallback_location: ajion2596dhi_root_path)
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  private  

  def set_product
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :main_image, :intro, :price, :category_id)
  end

  def product_params
    params.require(:priduct).permit(:size, :color, :image, :stock)
  end
end
