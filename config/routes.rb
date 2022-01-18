Rails.application.routes.draw do
  root 'orders#index'
  resources :orders
  namespace :orders do
    resources :csv, only: [:show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
