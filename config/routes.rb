Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get '/index', to: 'lists#index'
  # get '/lists/new', to: 'lists#new'
  # get '/lists/:id', to: 'lists#show'
  # post 'lists', to: 'lists#create'
  root 'lists#index'
  resources :lists, only: [:index, :new, :create, :show, :destroy] do
    resources :bookmarks, only: [ :create ]
  end
  resources :bookmarks, only: [ :destroy ]
end
