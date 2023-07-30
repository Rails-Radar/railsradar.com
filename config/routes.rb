# frozen_string_literal: true

Rails.application.routes.draw do
  resources :blip_activities
  resources :blips
  resources :interesting_things
  resources :team_users
  resources :teams
  
  get '/community', to: 'teams#show_community'
  get '/team', to: 'teams#show_team'
  get '/community/:kind', to: 'teams#show_community'
  get '/team/:kind', to: 'teams#show_team'

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'page#index'
end
