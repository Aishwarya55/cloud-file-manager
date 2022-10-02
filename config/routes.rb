# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'ping#index'

  namespace :api do
    namespace :v1 do
      get '/login', to: 'auth#register'
      post '/login', to: 'auth#login'
      resources :user, only: [:show]
    end
  end
end
