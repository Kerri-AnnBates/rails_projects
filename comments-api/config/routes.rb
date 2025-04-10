Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :accounts, only: [:index, :show]
  resources :comments, only: [:index, :show, :create, :update, :destroy]
end
