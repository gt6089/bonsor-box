Rails.application.routes.draw do
  get 'dashboard', to: 'dashboards#show', as: 'dashboard'

  resources :players, :rounds, :boxes

  post '/status', to: 'players#status', as: 'status'

  get '/signup', to: 'players#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
end
