== ShoppingCart

This project rocks and uses MIT-LICENSE.
This README would normally document whatever steps are necessary to get the application up and running.

* Mounting the Engine

Specify the engine inside the Gemfile:
  gem 'shopping_cart', path: "/path/to/shopping_cart"

By placing the gem in the Gemfile it will be loaded when Rails is loaded. It will first require lib/shopping_cart.rb from the engine, then lib/shopping_cart/engine.rb, which is the file that defines the major pieces of functionality for the engine.

To make the engine's functionality accessible from within an application, it needs to be mounted in that application's config/routes.rb file.

In config/routes.rb :
  mount ShoppingCart::Engine, at: "/cart"

* Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
