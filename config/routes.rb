Rails.application.routes.draw do
  devise_for :users, class_name: "Admin::User"

  namespace :admin do
    resources :users
    resources :roles
    resources :flows
    resources :tickets
  end

  root to: "users#index"
end
