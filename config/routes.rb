Rails.application.routes.draw do
  resources :users

  resources :tickets

  resources :concerts

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout', to: 'sessions#destroy'


end
