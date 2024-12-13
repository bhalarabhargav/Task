Rails.application.routes.draw do
  root "pages#index"

  resources :demo1s do
    member do
      get :file_preview  # Add a route for file preview
      get :delete_file # Add a route for deleting a file
    end
  end

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]
  resources :folders, only: [:new, :create, :show]

  # Additional routes
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'folders/new'
  get 'folders/show'
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'countries', to: 'demo1s#countries'  
  get 'cities', to: 'demo1s#cities'
  get 'states', to: 'demo1s#states'
end
