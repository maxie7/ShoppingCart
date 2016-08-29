module ShoppingCart
  class ApplicationController < ShoppingCart.parent_controller.constantize
    protect_from_forgery with: :exception

    def current_customer_order
       current_customer.orders.find_or_create_by(state: Order::STATE_IN_PROGRESS) unless current_customer.nil?
    end

    def countries
       @countries ||= Country.order(:name).map{|country| [country.name, country.id]}
    end

    def date_format(date)
       date.strftime("%d.%m.%Y %I:%M %p")
    end
  end
end
