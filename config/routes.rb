Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :activities, only: [:index, :show, :create, :update, :destroy] do
    resources :orders, only: [:show, :create]
    resources :reviews, only: [:index]
  end

  resources :activities, only: [] do
    resources :reviews, only: [:create, :destroy, :update]
  end
end
