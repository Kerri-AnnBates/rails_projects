Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :accounts

  resources :comments, only: [:index, :show, :create, :update, :destroy] do
    resources :replies, only: [:index, :show, :create, :update, :destroy], controller: 'comments'
  end
end
