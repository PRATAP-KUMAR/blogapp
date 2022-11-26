Rails.application.routes.draw do
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/users", to: "users#index", as: :users
  get "/users/:id", to: "users#show", as: :user
  get "/users/:user_id/posts", to: "posts#index", as: :user_posts
  get "/users/:user_id/posts/:id", to: "posts#show", as: :user_post

  root "users#index"
end
