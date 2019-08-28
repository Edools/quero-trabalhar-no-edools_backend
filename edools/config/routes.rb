Rails.application.routes.draw do
  root to: 'home#index'

  resources :schools
  resources :courses
end
