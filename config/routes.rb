Rails.application.routes.draw do
  # root "users#show"
  # get '/posts', to: "posts#show"
  resources :users, params: :user_id do
    resources :posts
  end
end
