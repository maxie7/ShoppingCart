module ShoppingCart
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      if ShoppingCart.set_order_on_each_request
        before_action :set_current_order
      end
    end

    def current_order
      @current_order
    end

    def set_current_order
      begin
        @current_order = ShoppingCart::Order.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        create_current_order
      end
    end

    def create_current_order
      @current_order = current_customer.orders.first_or_create.find_or_create_by(state: Order::STATE_IN_PROGRESS)
      session[:cart_id] = @current_order.id
    end


  end
end
