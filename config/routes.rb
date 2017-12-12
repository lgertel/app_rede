Rails.application.routes.draw do

  namespace :admin do
    resources :tickets
  end
  namespace :admin do
    resources :flows
  end
  namespace :admin do
    resources :users
  end
  namespace :admin do
    resources :users
    resources :roles
  end
end
