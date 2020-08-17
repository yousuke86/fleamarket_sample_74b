Rails.application.routes.draw do
  
  devise_for :users
  root 'items#index'


  resources :items do

    # collection => urlに/:idが表示されない。
    # member => urlに/:idが表示される。(三輪)
    member do
      get 'purchase'
      post 'purchase'
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end

  resources :users, only: [:show] do
    member do
      get 'amount'
      get 'point'
    end
  end
  resources :sending_destinations, only: [:new, :create, :edit, :update]
  resources :cards, only: [:new, :create]
  
end