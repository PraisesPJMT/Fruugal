Rails.application.routes.draw do
  get 'pages/splash'
  devise_for :users

  root to: "pages#splash"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:show]
end
