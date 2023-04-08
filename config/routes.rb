Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resource :reactions, only: [:create, :destroy]
  end
  resources :users
  resources :dailies
end
