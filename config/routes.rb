Rails.application.routes.draw do
  get 'stages/new'

  get 'stages/create'

  get 'stages/update'

  get 'stages/edit'

  get 'stages/destroy'

  get 'stages/index'

  get 'stages/show'

  get 'prospects/cal'

  resources :contacts

  resources :notes

  resources :emails

  resources :customers
  match '/ajax/stage', :to => "prospects#ajax", :via => [:post]
  match '/ajax/drop', :to => "prospects#drop", :via => [:post]
  resources :prospects

  resources :stages

  root to: 'customers#index'
  devise_for :users
  resources :users
  get "emails/contacts_by_customer/:id" =>"emails#contacts_by_customer"
end
