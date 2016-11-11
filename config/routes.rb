Rails.application.routes.draw do
  root 'schools#index'
  resources :schools
  get 'schools/:id/courses', to: 'schools#courses'
  resources :courses
end
