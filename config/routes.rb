Rails.application.routes.draw do

  resources :schools

  root 'schools#index'


end
