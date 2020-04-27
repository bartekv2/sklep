class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category
  end
end
