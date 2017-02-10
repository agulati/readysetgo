Rails.application.routes.draw do
  resources :races, only: [:new]

  root to: "races#new"
end
