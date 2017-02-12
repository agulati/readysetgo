require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :races, only: [:new, :create, :show] do
    get :run
  end

  root to: "races#new"
end
