Rails.application.routes.draw do
  get 'report/products'
  get 'sale/choose_products'
  post 'sale/add_product'
  post 'sale/remove_product'
  post 'sale/finish_sale'

  get 'logout', to: 'login#logout'
  get 'login', to: 'login#login'
  post 'authenticate', to: 'login#authenticate'
  get 'authenticated', to: 'login#authenticated'

  root :to => 'login#authenticated'
  # post 'report/filter_products'

  resources :sales
  resources :stores
  resources :customers
  resources :sellers
  resources :administrators
  resources :products
end
