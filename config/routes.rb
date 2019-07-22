Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'activity_categories_controller/create'
  get 'activity_categories_controller/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :activities, only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
