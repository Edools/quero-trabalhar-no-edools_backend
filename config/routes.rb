Rails.application.routes.draw do

  root 'dashboards#main'

  resources :schools do
    resources :courses
  end
end
