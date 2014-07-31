Rails.application.routes.draw do
  resources :contacts

  resources :notes

  resources :emails

  resources :customers

  root to: 'customers#index'
  devise_for :users
  resources :users
end
