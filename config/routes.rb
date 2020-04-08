Rails.application.routes.draw do
  resources :park_collections
  resources :users
  resources :notes

post '/parks', to: 'parks#index'

  resources :login, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
