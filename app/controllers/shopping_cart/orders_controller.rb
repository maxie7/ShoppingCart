require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class OrdersController < ApplicationController
    def index
      @orders = @orders.all_completed_orders
      @order = current_order
      @order_items = @order.products
    end

    def show
      @order_items = @order.products
      @order_total = @order.total_price + @order.delivery_price
    end
  end
end
