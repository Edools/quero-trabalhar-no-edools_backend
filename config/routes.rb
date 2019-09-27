Rails.application.routes.draw do

  root 'dashboards#main'

  resources :schools do
    collection do
      get :search
    end
    resources :courses, only: [:new, :create]
  end

  resources :courses, except: [:new, :create] do
    collection do
      get :search
    end
  end
end
