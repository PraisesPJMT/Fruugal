Rails.application.routes.draw do
  devise_for :users

  root to: "pages#splash"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:show]
  resources :pages
  resources :categories
end
