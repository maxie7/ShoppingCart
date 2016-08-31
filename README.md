==ShoppingCart

A Shopping Cart for Rails!

==Installation instructions

* Add in your gemfile and bundle gem 'shopping_cart', git: “https://github.com/maxie7/ShoppingCart”
* After gem install, copy migrations and run db:migrate rake shopping_cart:install:migrations
rake db:migrate
* Add current_customer method to ApplicationController.

* In console:
  rails g shopping_cart:install

After installation define your class-name in 'app/config/initializers/shopping_cart.rb'
By default: ShoppingCart.customer_class = “Customer”

  ShoppingCart.product_class  = "Book"

* Then define your routes in routes.rb
By default: mount ShoppingCart::Engine, at: '/cart', as: 'ShoppingCart'

==Views

* In console:
  rails g shopping_cart:view
