Rails.application.routes.draw do
  resources :park_collections
  resources :users
  # resources :parks

post '/parks', to: 'parks#index'
get '/parks', to: 'parks#parks'
  resources :login, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
