class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:id])
    current_user.liked_products << @product
    @liked_products = current_user.liked_products  

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: products_path, notice: "Product liked!" }
    end
  end

  def destroy
    @product = Product.find(params[:id])
    current_user.liked_products.delete(@product)
    @liked_products = current_user.liked_products  

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: products_path, notice: "Product unliked!" }
    end
  end

  def index
    @liked_products = current_user.liked_products
  end
end
