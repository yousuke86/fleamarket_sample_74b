Rails.application.routes.draw do
  
  devise_for :users
  root 'items#index'

  resources :items, only: [:new, :show, :create, :edit, :update] do
    # collection => urlに/:idが表示されない。
    # member => urlに/:idが表示される。(三輪)
    collection do
      get 'purchase'
      post 'purchase'
    end
  end

  resources :users, only: [:show]
  resources :sending_destinations, only: [:new, :create, :edit, :update]
  resources :cards, only: [:new, :create]
  
end
