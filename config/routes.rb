Rails.application.routes.draw do
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "users", to: "users#index"
  get "users/:id", to: "users#show"
  get "users/:user_id/posts", to: "posts#index"
  get "users/:user_id/posts/:id", to: "posts#show"

  root to: "users#index"
end
