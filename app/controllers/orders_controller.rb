class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @orders = current_user.orders.includes(order_items: :product) if current_user
  end

  def create
    product_id = params[:product_id]
    cart = current_user.cart

    if product_id
      cart_item = cart.cart_items.find_by(product_id: product_id)

      if cart_item
        order = current_user.orders.create!(total_price: cart_item.product.price * cart_item.quantity)

        order.order_items.create!(
          product: cart_item.product,
          quantity: cart_item.quantity
        )

        cart_item.destroy
        redirect_to orders_path, notice: "Order placed successfully!"
      else
        redirect_to cart_path, alert: "Product not found in your cart."
      end
    else

      cart_items = cart.cart_items

      if cart_items.any?
        order = current_user.orders.create!(total_price: cart_items.sum { |item| item.product.price * item.quantity })

        cart_items.each do |cart_item|
          order.order_items.create!(
            product: cart_item.product,
            quantity: cart_item.quantity
          )
        end

        cart.cart_items.destroy_all
        redirect_to orders_path, notice: "All items purchased successfully!"
      else
        redirect_to cart_path, alert: "Your cart is empty."
      end
    end
  end

  def clear_orders
    current_user.orders.destroy_all
    redirect_to orders_path, notice: "All orders cleared successfully!"
  end

  def buy_now
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    if quantity > 0
      order = current_user.orders.create!(total_price: product.price * quantity)

      order.order_items.create!(
        product: product,
        quantity: quantity
      )

      current_user.cart.cart_items.find_by(product: product)&.destroy

      redirect_to orders_path, notice: "Order placed successfully!"
    else
      redirect_to cart_path, alert: "Quantity must be at least 1."
    end
  end
end
