Rails.application.routes.draw do
  namespace :admin do
    resources :roles
  end
  namespace :admin do
    resources :users
  end
end
