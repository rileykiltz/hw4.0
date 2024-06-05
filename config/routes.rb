Rails.application.routes.draw do
  root 'places#index'

  resources :entries
  resources :places
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
 

  
end
