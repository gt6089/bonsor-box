Rails.application.routes.draw do
  resources :players
  resources :rounds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
end
