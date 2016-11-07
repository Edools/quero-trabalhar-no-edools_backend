Rails.application.routes.draw do
  resources :enrollments
  resources :courses
  resources :students
  resources :cities
  resources :states
  resources :countries
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
