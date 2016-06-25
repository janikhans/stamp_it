Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]

  resources :stamps do
    resources :bets, only: [:create, :edit, :update, :destroy, :new]
  end
  
  resources :bets, only: [:index]

  resources :dashboard, only: [:index]

  root 'dashboard#index'
end
