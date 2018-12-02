class ProductsController < ApplicationController
  before_action :validate_search_key, only: :search

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product)

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
      cart_item.quantity += 1
    elsif params[:type] == "substract"
      cart_item.quantity -= 1
    end

    if cart_item.quantity == 0
      cart_item.destroy
    else
      cart_item.save
    end
    # redirect_back(fallback_location: root_path)
  end

  def index
    @products = ProductItem.all
  end

  def landing
    gon.title = Scrape.pluck(:title)
    gon.size = Scrape.pluck(:size)
  end

  def search
    puts @query_string
    if @query_string.present?
     @products = Item.ransack(name_cont_any: [@query_string]).result
    end
    puts @query_string
  end

  protected

  def validate_search_key
    @query_string = params[:search].gsub(/\\|\'|\/|\?/, "") if params[:search].present?
  end

end
