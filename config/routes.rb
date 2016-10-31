Rails.application.routes.draw do
  get 'game/index'

 root 'game#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'games#index'
  resources :users
end
