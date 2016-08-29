module ShoppingCart
  class OrderItem < ActiveRecord::Base
    belongs_to :product, class_name: ShoppingCart.product_class.to_s
    belongs_to :order

    validates :price, :order, :quantity, presence: true

    def find_by_order_id(order)
      self.where(order_id: order)
    end
  end
end
