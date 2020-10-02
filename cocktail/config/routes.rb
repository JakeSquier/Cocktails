Rails.application.routes.draw do
  resources :drinks
  resources :ingredients
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/sign_in', to: 'sessions#sign_in'
  post '/sign_in', to: 'sessions#create'
end