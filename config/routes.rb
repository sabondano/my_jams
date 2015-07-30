Rails.application.routes.draw do
  resources :songs
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :users
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'songs#index'
end
