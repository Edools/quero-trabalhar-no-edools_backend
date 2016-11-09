Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :schools
  resources :courses
  
  get 'school/:school_id/courses', to: 'courses#by_school', as: 'school_courses'
  get 'school/:school_id/courses/new', to: 'courses#new', as: 'new_school_courses'
  get 'school/students/active', to: 'schools#active_students', as: 'school_active_students'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
end

