Rails.application.routes.draw do
  devise_for :users
  root to: 'schools#index'

  resources :schools
end
