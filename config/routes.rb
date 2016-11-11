Rails.application.routes.draw do
  get 'reports/schools_active_students'

  root 'schools#index'
  resources :schools
  get 'schools/:id/courses', to: 'schools#courses'
  resources :courses
end
