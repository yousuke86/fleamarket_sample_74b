Rails.application.routes.draw do
  
  devise_for :users
  root 'items#index'
  resources :users, only: [:show]
  resources :sending_destinations, only: [:new, :create]
  resources :cards, only: [:new, :create]
  
end
