Rails.application.routes.draw do
  resources :schools
  devise_for :users

  root to: "schools#index"
end
