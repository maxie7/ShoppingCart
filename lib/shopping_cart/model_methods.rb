module ShoppingCart
  module ModelMethods
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_product
        class_name = self.to_s.underscore
        ShoppingCart::PRODUCT_CLASSES.push(class_name).uniq!
        extend_product(self)
      end

      def acts_as_customer
        extend_customer(self)
      end

      def extend_product(product_class)
        product_class.send(:has_many, :order_items, {
                                        class_name: 'ShoppingCart::OrderItem',
                                        as: :product,
                                        dependent: :destroy
                                    })
      end

      def extend_customer(customer_class)
        customer_class.send(:has_many, :orders, {
                                         class_name: 'ShoppingCart::Order',
                                         as: :customer,
                                         dependent: :nullify
                                     })
      end
    end
  end
end
