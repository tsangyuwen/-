class Ajion2596dhi::ProductsController < ApplicationController
  def index
    @text = "萬聖節"
    gon.text = @text
    @size = 50
  end
end
