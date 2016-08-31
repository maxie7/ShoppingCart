require 'rails/generators'

module ShoppingCart
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def copy_initializer_file
      copy_file "shopping_cart.rb", "config/initializers/shopping_cart.rb"
      route "mount ShoppingCart::Engine, at: '/cart', as: 'shopping_cart'"
    end
  end
end
