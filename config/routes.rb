Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  root 'static_pages#home'

  namespace :admin do
    resources :users do
      resources :posts
    end
  end
  resources :users do
    resources :posts
  end
  resources :events
end
