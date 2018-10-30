class ProductsController < ApplicationController

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
    @product = Product.find(prams[:id])
    cart_item = current_cart.cart_items.find_by(product_id: @product)
    if params[:type] == "add"
      cart_item.quantity += 1
    elsif params[:type] == "substract"
      cart_item.quantity -= 1
    end

    if cart_item.quantity == 0
      cart_item.destroy
    else
      cart_item.destroy
    end

    #redirect_back(fallback_location: root_path)
  end

  def index
    @products = Product.all
  end

  def landing
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 120 # seconds

    browser = Watir::Browser.start 'https://trends.google.com.tw/trends/trendingsearches/daily?geo=TW', :chrome, headless: true, http_client: client

    g_text = browser.text.split("\n")

    i = 10
    @g_data = []
    while i < g_text.length-20
      if g_text[i][0..4].to_i > 2000
        i = i + 2
      elsif g_text[i].to_i == 1
        i = i + 1
      else
        @g_data << g_text[i]
        @g_data << g_text[i + 3]
        i = i + 8
      end
    end 

    browser.goto 'https://tw.yahoo.com/'

    y_text = browser.text[0..500].split("\n")
    @y_data = []
    @y_data << y_text[5..12]

    browser.close

    gon.g_data = @g_data
    gon.y_data = @y_data
  end

end
