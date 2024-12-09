Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  resources :demo1s
  root"pages#index"
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]
  resources :demo1, only: [:new]
  resources :folders, only: [:new, :create, :show] 
  get 'folders/new'
  get 'folders/show'
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'cities', to: 'demo1s#cities'
  get 'states', to: 'demo1s#states'
  resources :demo1s do
    member do
      get :file_preview # Add a route for file preview
    end
  end

end
