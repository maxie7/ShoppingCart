Rails.application.routes.draw do
  devise_for :users
  mount ShoppingCart::Engine => "/shopping_cart", as: 'ShoppingCart'

  root 'books#index'
  resources :books, only: [:index, :show]
end
