Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :accounts, only: [:index, :show] do
    resources :comments, only: [:index, :create]
  end

  resources :comments, only: [:index, :show, :create, :update, :destroy] do
    resources :replies, only: [:index, :show, :create, :update, :destroy], controller: 'comments'
  end
end
