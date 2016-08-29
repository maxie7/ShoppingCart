require "shopping_cart/engine"

module ShoppingCart
  mattr_accessor :customer_class, :product_class
  mattr_accessor :parent_controller
  
  @@parent_controller = 'ApplicationController'

  def self.customer_class
    @@customer_class.constantize
  end

  def self.product_class
    @@product_class.constantize
  end
end
