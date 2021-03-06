require 'sidekiq/web'

Rails.application.routes.draw do
  mount_griddler('/email/incoming')

  namespace :admin do
    resources :users
    resources :announcements
    resources :notifications

    root to: "users#index"
  end

  resources :forum_threads do
    resources :posts
  end

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'forum_threads#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
