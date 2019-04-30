Rails.application.routes.draw do
  get 'lists/carender'
  get 'lists/month'

  devise_for :users
  resources :lists
  get "home/index" =>"home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
