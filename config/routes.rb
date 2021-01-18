Rails.application.routes.draw do
	root 'products#index'
	devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/search', to: 'products#index', as: 'search_products'
  get '/products/:id', to: 'products#show', as: 'product'
end
