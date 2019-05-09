Rails.application.routes.draw do
  resources :comments
  resources :likings#, only: [:create]
  resources :posts
  resources :users
  resources :login, only: [:new, :create]
  # root "posts#index"
  root 'login#new'
  delete "logout", to: "login#destroy", as: "log_out"
  # get "logout", to: "login#destroy", as: "log_out"

  # get 'new_liking', to: 'likings#create'#, as: 'liked_post'
  get "posts/:id/new_liking", to:'likings#create', as: 'new_like'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
