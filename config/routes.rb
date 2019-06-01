Rails.application.routes.draw do
  get 'lists/carender'
  get 'lists/month'
  get 'lists/reset'
  get 'lists/room/:room', to: 'lists#room', as: 'lists_room'

  devise_for :users
  resources :lists
  resources :spaces
  get "home/index" =>"home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
