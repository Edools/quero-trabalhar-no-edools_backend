Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to:'pages#home'
  resources :courses
  resources :schools
  resources :user_course_registrations
  get '/csv_records', to: 'schools#csv_schools'

end
