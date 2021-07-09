Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/discover', to: 'discover#index'

  resources :movies, only: [:index, :show]
  resources :dashboard, only: [:index, :create]
end
