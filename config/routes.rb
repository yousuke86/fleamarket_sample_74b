Rails.application.routes.draw do
  
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :show]
  resources :users, only: [:show]
  resources :sending_destinations, only: [:new]
  resources :cards, only: [:new, :create]
  
end
