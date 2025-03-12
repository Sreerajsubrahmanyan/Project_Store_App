class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [ :like, :unlike ]
  def index
    @products = Product.all

    if params[:query].present?
      @products = @products.where("name LIKE ?", "%#{params[:query]}%")
    end

    @products = @products.where(category: params[:category]) if params[:category].present?

    @products = @products.where("price <= ?", params[:max_price]) if params[:max_price].present?

    @products = @products.where("price >= ?", params[:min_price]) if params[:min_price].present?

    @categories = Product.pluck(:category).uniq
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def search
    @products = Product.where("name LIKE ?", "%#{params[:query]}%")
    render "index"
  end

  def like
    product = Product.find(params[:id])
    Like.create(user: current_user, product: product)
    redirect_back(fallback_location: products_path)
  end

  def unlike
    product = Product.find(params[:id])
    current_user.likes.find_by(product: product)&.destroy
    redirect_back(fallback_location: products_path)
  end
end
