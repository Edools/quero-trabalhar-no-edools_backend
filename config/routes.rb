Rails.application.routes.draw do
  resources :students
  resources :courses
  resources :schools
  resources :reports, only: [:index]
  
  root 'home#index'
  
  get 'student/:id/select_course' => 'students#select_course'
  post "/matriculate" => "students#matriculate", :as => :matriculate
end
