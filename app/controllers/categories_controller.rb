class CategoriesController < ApplicationController

  def woman
    basic_set("woman")
  end

  def man
    basic_set("man")
  end

  def kid
    basic_set("kid")
  end

  def baby
    basic_set("baby")
  end

  def show
    @category = Category.find(params[:id])
    basic_set(@category.who)
    @products = Product.where(category_id: @category).order(created_at: :desc)
  end

  private

  def basic_set(who)
    @categories = Category.where(who: who)
    @where = Category.set_where(@categories)
    @products = Product.where(category_id: @categories).order(created_at: :desc)
  end

end
