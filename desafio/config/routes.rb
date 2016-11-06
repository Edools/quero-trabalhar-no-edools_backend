Rails.application.routes.draw do
  resources :schools
  resources :courses, except: [:new, :create]
  root "static#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
