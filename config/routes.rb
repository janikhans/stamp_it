Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]

  resources :stamps do
    member do
      post "mark_complete"
      post "set_complete"
    end
    resources :bets, only: [:create, :edit, :update, :destroy, :new]
  end

  resources :bets, only: [:index]

  resources :dashboard, only: [:index]

  root 'dashboard#index'
end
