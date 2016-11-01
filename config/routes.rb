Rails.application.routes.draw do
  root 'games#index'
  resources :users
  resources :games, only: [:index, :new, :show, :update]
  get '/sessions/new', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/sessions/delete', to: 'sessions#delete'
end
