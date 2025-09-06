Rails.application.routes.draw do
  resources :accounts

  resources :comments, only: [:index, :show, :create, :update, :destroy] do
    resources :replies, only: [:index, :show, :create, :update, :destroy], controller: "comments"
  end

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
