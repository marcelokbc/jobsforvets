Rails.application.routes.draw do
  resources :companies, only: [:new, :edit, :create, :update]
  resources :positions
  resources :applicants, only: [:index, :new, :create]
  devise_for :users
  root "home#index"
  get "/vaga/:slug", action: :public_position, controller: :positions, as: :public_position
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
