Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
