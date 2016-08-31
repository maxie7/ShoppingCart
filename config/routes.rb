ShoppingCart::Engine.routes.draw do
  resources :order_steps, only: [:show, :update]
  resources :orders, only: [:index, :show, :update]
  resources :order_items, only: [:index, :destroy, :create] do
    collection do
      delete 'destroy_all', action: 'destroy_all'
      put    'update_all',  action: 'update'
    end
  end
end
