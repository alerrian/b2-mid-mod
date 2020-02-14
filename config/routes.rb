Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/studios', to: 'studios#index'

  get '/actors/:id', to: 'actors#show'

  get 'movies/:id', to: 'movies#show'
  patch 'movies/:id', to: 'movies#update'
end
