Rails.application.routes.draw do
  root 'application#home'
  resources :github_infos
  # resource :users, only: [:create]
  post "/login", to: "users#login"
end
