Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :notes, only: %i(new create index destroy)

  root to: "notes#index"
end
