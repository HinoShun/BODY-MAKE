Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resource :reactions, only: [:create, :destroy]
    resources :comments, only: [:new, :create, :destroy]
  end
  resources :users
  resources :dailies
  get 'pages/news'
end
