require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  devise_for :users, controllers: { registrations: "registrations" }
  
  namespace :admin do
    resources :dashboards, only: [:index]
    resources :users
    resources :companies 
    resources :positions, only: [:index]
    
    root to: "dashboards#index"
  end
  
  
  resources :companies, only: [:new, :edit, :create, :update]
  resources :positions do 
    resources :applicants, only: [:index]
    put :update_applicants_status, on: :member
  end

  resources :applicants, only: [:new, :create]
    resources :applied_vacancies, only: [:index]

  root "home#index"
  get "/vaga/:slug", action: :public_position, controller: :positions, as: :public_position
  # dashboard para a empresa
  get "/dashboard", action: :dashboard, controller: :companies, as: :company_dashboard
end
