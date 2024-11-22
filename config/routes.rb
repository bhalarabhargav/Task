Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/create'
  resources :demo1s
  root"pages#index"
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]
  resources :demo1, only: [:new]
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'pages/secret'
end
