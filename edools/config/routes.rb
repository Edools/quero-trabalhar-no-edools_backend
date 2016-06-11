Rails.application.routes.draw do
  resources :schools
  resources :courses
  resources :students
  resources :course_students
  resources :reports
  root "courses#index"
end
