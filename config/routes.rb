Rails.application.routes.draw do
  get '/about', to: 'static_pages#about', as: 'about'
  get '/orders', to: 'static_pages#orders', as: 'orders'
  get '/profile', to: 'static_pages#profile', as: 'profile'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'products#index'
  devise_for :users,
             controllers: { registrations: 'users/registrations', sessions: 'users/sessions',
                            omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/search', to: 'products#index', as: 'search_products'
  get '/products/:id', to: 'products#show', as: 'product'
  resources :products do
    resources :cart_items, only: %i[create update destroy]
    resources :comments
  end
  resources :carts, only: %i[show update]
  resources :orders, only: %i[create new]
end
