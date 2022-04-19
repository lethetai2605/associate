Rails.application.routes.draw do
  root "users#show"
  get '/posts', to: "posts#show"
end
