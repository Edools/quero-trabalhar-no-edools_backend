Rails.application.routes.draw do
  get 'pages/index'

  devise_for :users
  root to: 'pages#index'

  resources :enrollments
  resources :courses
  resources :students
  resources :cities
  resources :states
  resources :countries
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
