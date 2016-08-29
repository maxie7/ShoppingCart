module ShoppingCart
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingCart

    config.generators do |x|
    x.test_framework      :rspec,        :fixture => false
    x.fixture_replacement :factory_girl, :dir => 'spec/factories'
    x.assets false
    x.helper false
    end
  end
end
