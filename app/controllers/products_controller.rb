class ProductsController < ApplicationController

  def index
    #@products = Product.order(created_at: :desc).page(params[:page]).per(6)
    @products = Product.where_assoc_exists(:variants).order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category
    @variants = @product.variants.order(size_id: :asc)
    @quantity = @variants.sum(:quantity)
  end
end
