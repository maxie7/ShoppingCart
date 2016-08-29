module ShoppingCart
  class Address < ActiveRecord::Base
    validates  :address, :first_name, :last_name, :city, :phone, :country,:zipcode,  presence: true
    belongs_to :country
    belongs_to :customer, class_name: ShoppingCart.customer_class
  end
end
