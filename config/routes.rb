Rails.application.routes.draw do
  resources :users do 
    resources :tickets
  end 

  resources :concerts, only: [:index, :show]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout', to: 'sessions#destroy'

  get '/', to: 'welcome#home'


end
