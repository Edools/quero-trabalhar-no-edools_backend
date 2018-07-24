Rails.application.routes.draw do
  resources :courses
  root :to => "schools#index"
  resources :schools
end
