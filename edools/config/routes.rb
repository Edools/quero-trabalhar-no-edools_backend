Rails.application.routes.draw do
  resources :schools
  resources :courses
  resources :students
  resources :course_students
  root "courses#index"
end
