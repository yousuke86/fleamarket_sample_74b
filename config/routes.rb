Rails.application.routes.draw do
  
  # devise_for :users
  devise_for :users, controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  root 'items#index'


  resources :items do

    # collection => urlに/:idが表示されない。
    # member => urlに/:idが表示される。(三輪)
    member do
      get 'purchase'
      post 'purchase'
      post 'pay'
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
      get 'list'
    end
  end

  resources :users, only: [:show] do
    member do
      get 'amount'
      get 'point'
    end
  end
  resources :sending_destinations, only: [:new, :create, :edit, :update]
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  
end