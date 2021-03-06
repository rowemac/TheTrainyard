Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/concerts/early', to: 'concerts#early'
  get '/search', to: 'concerts#search'
  # get '/concerts/popular', 'concerts#popular'
  
  resources :concerts, only: [:index, :show] do
    resources :tickets, only: [:show, :new, :create, :edit, :update, :destroy]
  end 
  
  get '/', to: "application#home"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  match '/auth/:provider/callback', to: 'sessions#google', via: [:get, :post]
  get '/:anything', to: 'application#wrong_page'
  get '/concerts/:anything/tickets', to: 'application#wrong_page' 
end


# custom route /concerts/popular
# render index page
# create scope method that will find top 5 concerts by how many tickets