Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :activities, only: [:index, :show, :create, :update, :destroy]
  resources :reviews, only: [:create, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
