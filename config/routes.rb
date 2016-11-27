Rails.application.routes.draw do
  get 'report/products'
  # post 'report/filter_products'

  resources :sales
  resources :stores
  resources :customers
  resources :sellers
  resources :administrators
  resources :products
end
