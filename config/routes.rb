Rails.application.routes.draw do
  resources :players, :rounds, :boxes

  get '/signup', to: 'players#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
end
