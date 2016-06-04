DesafioEdoolsBackend::Application.routes.draw do
  resources :students
  resources :courses
  resources :schools
  
  root 'home#index' 
end
