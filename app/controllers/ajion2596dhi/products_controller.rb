class Ajion2596dhi::ProductsController < ApplicationController
  def index
    require 'magic_cloud'

    words = [
      ['T-shirt', 50],
      ['長袖', 40],
      ['連帽', 30],
    ]
    @cloud = MagicCloud::Cloud.new(words, rotate: :free, scale: :log)
    img = @cloud.draw(500, 500)
    img.write("#{Rails.root}/app/assets/images/cloud.jpg")
  end
end
