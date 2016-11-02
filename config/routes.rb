Rails.application.routes.draw do
  resources :matches

  resources :players

  post '/versus', to: 'players#versus'

  root to: "players#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
