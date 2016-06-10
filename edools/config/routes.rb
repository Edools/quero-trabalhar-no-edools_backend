Rails.application.routes.draw do
  resources :schools
  resources :courses
  resources :students
  root "courses#index"
end
