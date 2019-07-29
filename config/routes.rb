
Rails.application.routes.draw do

  get 'dashboard', to: 'users#dashboard'

  devise_for :users
  root to: 'pages#home'

  resources :activities, only: [:index, :show, :create, :update, :destroy] do
    resources :orders, only: [:show, :create]
    resources :favorites, only: :create
  end

  resources :favorites, only: [:create, :destroy]

  resources :orders, only: [] do
    resources :activity_reviews, only: [:create, :update]
  end

  resources :order, only: [] do
    resources :payments, only: [:new, :create]
  end

  resources :activity_categories, only: [:create, :destroy]

  resources :orders, only: [:destroy]
  resources :activity_reviews, only: [:destroy]

  get '/followers/:user_id', to: 'followers#followers', as: 'followers'
  get '/following/:user_id', to: 'followers#following', as: 'following'
  resources :followers, only: [:create, :destroy]

end
