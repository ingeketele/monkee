Rails.application.routes.draw do
  get 'dashboard', to: 'users#dashboard'

  devise_for :users
  root to: 'pages#home'

  resources :activities, only: [:index, :show, :create, :update, :destroy] do
    resources :orders, only: [:show, :create]
  end

  resources :activities, only: [] do
    resources :acitivity_reviews, only: [:create, :update, :destroy]
  end
end
