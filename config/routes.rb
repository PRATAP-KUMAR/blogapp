Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
      post :login, to: "authentication#login"
      post :register, to: "register#register"
      resources :users do
        resources :posts do
          resources :comments
        end
      end
    end
  end
end
