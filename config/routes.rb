Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :posts
  resources :contacts, only: [:index, :create, :destroy]
  resources :messages, only: [:index, :create]
end