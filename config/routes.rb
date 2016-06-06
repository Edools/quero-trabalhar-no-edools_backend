Rails.application.routes.draw do
  resources :schools
  resources :courses
  get '/schools_active_students', to: 'schools#schools_active_students'

end
