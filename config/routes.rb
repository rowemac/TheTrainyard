Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show, :delete]

  resources :concerts, only: [:index, :show] do
    resources :tickets, only: [:new, :create, :edit, :update, :show, :delete]
  end 

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout', to: 'sessions#destroy'

  get '/', to: 'welcome#home'
  get '/:anything', to: 'application#wrong_page'

end
