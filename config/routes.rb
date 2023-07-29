# frozen_string_literal: true

Rails.application.routes.draw do
  resources :blips
  resources :interesting_things
  resources :team_users
  resources :teams
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
