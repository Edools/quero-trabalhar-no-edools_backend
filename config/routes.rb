Rails.application.routes.draw do
  devise_for :users
  root to: 'schools#index'

  resources :schools do
    resources :courses do
      resources :courses_students
    end
  end
  resources :students
  resources :active_students, only: :index
end
