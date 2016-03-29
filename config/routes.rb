Rails.application.routes.draw do

  root 'auctions#index'

  resources :auctions do
    resources :bids
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
  end

end
