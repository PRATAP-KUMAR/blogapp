Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
  root to: "users#index"

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
        end
      end
    end
  end
end
