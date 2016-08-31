module ShoppingCart
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingCart

    config.generators do |x|
    x.test_framework      :rspec,        :fixture => false
    x.fixture_replacement :factory_girl, :dir => 'spec/factories'
    x.assets false
    x.helper false
    end

    initializer 'shopping_cart' do
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.include ShoppingCart::ModelMethods
      end

      ActiveSupport.on_load :action_controller do
        ActionController::Base.include ShoppingCart::ControllerMethods
        ActionController::Base.helper ShoppingCart::ApplicationHelper
      end
    end
  end
end
