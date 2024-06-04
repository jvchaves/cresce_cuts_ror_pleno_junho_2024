Rails.application.routes.draw do
  resources :descontos
  resources :produtos
  resources :lojas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  namespace :api do
    namespace :v1 do
      resources :produtos
    end
  end
end
