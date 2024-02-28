require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  resources :companies, only: [:new, :edit, :create, :update]
  resources :positions do 
    resources :applicants, only: [:index]
  end
  resources :applicants, only: [:new, :create]
  devise_for :users, controllers: { registrations: "registrations" }
  root "home#index"
  get "/vaga/:slug", action: :public_position, controller: :positions, as: :public_position
end
