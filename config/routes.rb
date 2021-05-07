Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create, :edit, :update, :delete] do 
    resources :tickets
  end 

  resources :concerts, only: [:index, :show]
end
