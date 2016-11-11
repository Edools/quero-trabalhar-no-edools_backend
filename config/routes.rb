Rails.application.routes.draw do
  get 'static_pages/index'

  root 'static_pages#index'

  resources :schools, except: [:edit, :update]
  resources :courses, except: [:edit, :update]
end
