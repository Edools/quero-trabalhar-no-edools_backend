Rails.application.routes.draw do

  root 'dashboards#main'

  resources :schools do
    collection do
      get :search
    end
    resources :courses, only: [:new, :create, :edit, :update]
    resources :students, only: [] do
      collection do
        get :active_students_by_school
      end
    end
  end

  resources :courses, except: [:new, :create, :edit, :update] do
    collection do
      get :search
    end
    resources :students, only: [:new, :create] do
      member do
        get :activate
        get :deactivate
      end
    end
  end
end
