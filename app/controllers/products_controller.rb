class ProductsController < ApplicationController
  before_action :validate_search_key, only: :search
  before_action :authenticate_user!, except: :welcome

  def welcome

  end

  def add_to_cart
    @item = Item.find(params[:id])
    @product = @item.products.where(color: params[:color], size: params[:size]).first
    current_cart.add_cart_item(@product, params[:quantity])

    #redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    @product = Product.find(params[:id])
    cart_item = current_cart.cart_items.find_by(product_id: @product)
    cart_item.destroy
    #redirect_back(fallback_location: root_path)
  end

  def adjust_item
    @product = Product.find(params[:id])
    cart_item = current_cart.cart_items.find_by(product_id: @product)
    if params[:type] == "add"
      if cart_item.quantity < @product.stock.to_i
        cart_item.quantity += 1
      end
    elsif params[:type] == "substract"
      cart_item.quantity -= 1
    elsif !params[:number].nil?
      cart_item.quantity = params[:number]
    end

    if cart_item.quantity == 0
      cart_item.destroy
    else
      cart_item.save
    end
    # redirect_back(fallback_location: root_path)
  end

  def search_size
    @product = Product.find(params[:id])
    @size = @product.products.where(color: params[:color]).pluck(:size).uniq
  end

  def index
    @products = ProductItem.all
  end

  def landing
    gon.title = Scrape.last(22).pluck(:title)
    gon.size = Scrape.last(22).pluck(:size)
  end

  def search
    if @query_string.present?
     @products = Item.ransack(name_cont_any: [@query_string]).result
    end
  end

  protected

  def validate_search_key
    @query_string = params[:search].gsub(/\\|\'|\/|\?/, "") if params[:search].present?
  end

end
