Rails.application.routes.draw do
  root 'products#index'
  get '/search', to: 'products#index', as: 'search_products'
  get '/products/:id', to: 'products#show', as: 'product'
end
