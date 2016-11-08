Rails.application.routes.draw do
  get 'students_reports/active_by_school'

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

  get 'reports/active_students_pdf' => 'students_reports#active_by_school_pdf', as: 'active_by_school_pdf'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
