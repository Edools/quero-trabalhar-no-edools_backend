Rails.application.routes.draw do

  resources :schools, except: :show

  root 'schools#index'


end
