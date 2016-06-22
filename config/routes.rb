Rails.application.routes.draw do

  devise_for :users

  resources :stamps do
    resources :bets, only: [:create,:edit,:update,:destroy]
  end

  resources :bets, only: [:index]

  root 'stamps#index'
end
