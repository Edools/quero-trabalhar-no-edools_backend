Rails.application.routes.draw do

  root 'dashboards#main'

  resources :schools do
    collection do
      get :search
    end
  end

  resources :courses do
    collection do
      get :search
    end
  end
end
