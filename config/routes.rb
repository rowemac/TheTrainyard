Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show, :delete]

  resources :concerts, only: [:index, :show] do
    resources :tickets, only: [:show, :new, :create, :edit, :update, :destroy]
  end 
  
  get '/', to: "application#home"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/:anything', to: 'application#wrong_page'

end
