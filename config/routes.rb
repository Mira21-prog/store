Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'products#index'
  get '/search', to: 'products#index', as: 'search_products'
  get '/products/:id', to: 'products#show', as: 'product'
end
