Rails.application.routes.draw do
  
  devise_for :users
  root 'items#index'

  resources :items, only: [:new, :show] do
    # collection => urlに/:idが表示されない。
    # member => urlに/:idが表示される。(三輪)
    collection do
      get 'purchase'
      post 'purchase'
    end
  end

  resources :users, only: [:show]
  resources :sending_destinations, only: [:new]
  resources :cards, only: [:new, :create]
  
end
