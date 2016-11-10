Rails.application.routes.draw do
  root 'home#index'

  resources :schools, except: [:show]
  resources :courses, except: [:show]
end
