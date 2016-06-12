Rails.application.routes.draw do
  resources :schools, except: :show do
    resources :courses
  end

  root 'schools#index'
end
