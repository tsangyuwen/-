class CategoriesController < ApplicationController
  def woman
    @categories = Category.where(who: "woman")
    @products = Product.where(category_id: @categories).order(created_at: :desc)
  end

  def man
    @categories = Category.where(who: "man")
    @products = Product.where(category_id: @categories).order(created_at: :desc)
  end

  def kid
    @categories = Category.where(who: "kid")
    @products = Product.where(category_id: @categories).order(created_at: :desc)
  end

  def baby
    @categories = Category.where(who: "baby")
    @products = Product.where(category_id: @categories).order(created_at: :desc)
  end

end
