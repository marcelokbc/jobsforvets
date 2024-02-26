require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  resources :companies, only: [:new, :edit, :create, :update]
  resources :positions do 
    resources :applicants, only: [:index]
  end
  resources :applicants, only: [:new, :create]
  devise_for :users
  root "home#index"
  get "/vaga/:slug", action: :public_position, controller: :positions, as: :public_position
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
