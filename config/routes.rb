Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]

  resources :stamps do
    member do
      post "mark_complete"
      post "mark_complete_true"
      post "mark_complete_false"
    end
    resources :bets, only: [:create, :edit, :update, :destroy, :new]
  end

  resources :bets, only: [:index]

  resources :dashboard, only: [:index]

  root 'dashboard#index'
end
