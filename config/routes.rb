Rails.application.routes.draw do
  resources :park_collections
  resources :users
  # resources :parks

# post '/parks', to: 'parks#index'
get '/parks/first_set', to: 'parks#first_fetch'
get '/parks/second_set', to: 'parks#second_fetch'
get '/parks/third_set', to: 'parks#third_fetch'
get '/parks/fourth_set', to: 'parks#fourth_fetch'
get '/parks/fifth_set', to: 'parks#fifth_fetch'

post '/parks', to: 'parks#index'




  resources :login, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
