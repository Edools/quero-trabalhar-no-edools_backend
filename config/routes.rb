DesafioEdoolsBackend::Application.routes.draw do
  resources :students
  resources :courses
  resources :schools
  
  root 'home#index'
  
  get 'student/:id/select_course' => 'students#select_course'
  post "/matriculate" => "students#matriculate", :as => :matriculate
end
