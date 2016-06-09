Rails.application.routes.draw do
  resources :schools do
    resources :courses
  end

  resources :schools do
    resources :students
  end

  root 'schools#index'

  post "schools/:id/courses/new" => "courses#create"
  patch "schools/:id/courses/:id/edit" => "courses#update"
  post "schools/:id/students/new" => "students#create"
  patch "schools/:school_id/students/:id/edit" => "students#update"
  delete "schools/:school_id/students" => "students#destroy"
end
