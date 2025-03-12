class CartItemsController < ApplicationController
  before_action :authenticate_user!


  def create
    cart = current_user.cart || current_user.create_cart
    cart_item = cart.cart_items.find_by(product_id: params[:product_id])

    if cart_item
      flash[:alert] = "This product is already in your cart."
      redirect_back(fallback_location: products_path)
    else
      cart.cart_items.create!(product_id: params[:product_id], quantity: 1)
      flash[:notice] = "Product added to cart!"
      redirect_to cart_path
    end
  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to cart_path, notice: "Removed from cart"
  end

  def clear_cart
    current_user.cart.cart_items.destroy_all
    redirect_to cart_path, notice: "Cart cleared successfully!"
  end
end
