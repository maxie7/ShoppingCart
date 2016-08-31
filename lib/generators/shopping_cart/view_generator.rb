require 'rails/generators'

module ShoppingCart
  module Generators
    class ViewGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates/shopping_cart", __FILE__)

      def copy_views
        directory "orders", "app/views/shopping_cart/orders"
        directory "order_items", "app/views/shopping_cart/order_items"
        directory "order_steps", "app/views/shopping_cart/order_steps"
        directory "shared", "app/views/shopping_cart/shared"
      end
    end
  end
end
