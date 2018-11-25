class Ajion2596dhi::ItemsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("id DESC").page(params[:page]).per(20)
  end

  def new_man
    @item = Item.new
  end

  def new_woman
    @item = Item.new
  end

  def new_kid
    @item = Item.new
  end

  def new_baby
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @product = Product.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "item was successfully created"
      redirect_to ajion2596dhi_root_path
    else
      flash.now[:alert] = "item was failed to create"
      render :new
    end
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

  def destroy
    @item.destroy
    redirect_to ajion2596dhi_root_path
    flash[:alert] = "item was deleted"
  end

  private  

  def set_product
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :main_image, :intro, :price, :category_id)
  end
end
