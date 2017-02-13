require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :races, only: [:index, :new, :create, :show] do
    get :run
  end

  root to: "races#index"
end
