Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, class_name: "Admin::User"

  namespace :admin do
    resources :users
    resources :flows
    resources :tickets
  end

  root to: "home#index"
end
