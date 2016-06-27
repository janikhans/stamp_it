Rails.application.routes.draw do

  root 'pages#index'

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

  get 'dashboard' => 'dashboard#index'

end
