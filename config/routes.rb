Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :games
  get 'games', to: 'games#index'
  get 'games/:id', to: 'games#show'

  get 'companies', to: 'companies#index'
  get 'companies/:id', to: 'companies#show'
end
