== ShoppingCart

This project rocks and uses MIT-LICENSE.

== Mounting the Engine

Specify the engine inside the Gemfile:
  gem 'shopping_cart', path: "/path/to/shopping_cart"

By placing the gem in the Gemfile it will be loaded when Rails is loaded. It will first require lib/shopping_cart.rb from the engine, then lib/shopping_cart/engine.rb, which is the file that defines the major pieces of functionality for the engine.

To make the engine's functionality accessible from within an application, it needs to be mounted in that application's config/routes.rb file.

In config/routes.rb :
  mount ShoppingCart::Engine, at: "/cart"
