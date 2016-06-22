Rails.application.routes.draw do
  resources :stamps
  devise_for :users

  root 'stamps#index'
end
