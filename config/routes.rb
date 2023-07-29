Rails.application.routes.draw do
  resources :community_blips
  resources :team_blips
  resources :team_users
  resources :teams
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
