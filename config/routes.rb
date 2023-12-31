# frozen_string_literal: true

Rails.application.routes.draw do
  resources :blip_activities
  resources :blips
  resources :interesting_things
  resources :team_users
  resources :teams do
    member do
      post :vote
    end
  end

  get '/community', to: 'teams#show_community'
  get '/team', to: 'teams#show_team', as: 'my_team'
  get '/about', to: 'page#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'community#index'

  get 'community/:id', to: 'community#show', as: 'community_show'
  get '/activity', to: 'community#activity', as: 'community_activity'
end
