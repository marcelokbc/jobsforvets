require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  
  resources :companies, only: [:new, :edit, :create, :update]
  resources :positions do 
    resources :applicants, only: [:index]
    put :update_applicants_status, on: :member
  end

  resources :applicants, only: [:new, :create]
    resources :applied_vacancies, only: [:index]

  devise_for :users, controllers: { registrations: "registrations" }
  root "home#index"
  get "/vaga/:slug", action: :public_position, controller: :positions, as: :public_position
end
