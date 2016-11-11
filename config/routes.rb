Rails.application.routes.draw do
  get 'reports/schools_active_students'

  root 'schools#index'
  resources :schools do
    get '/search_name', to: 'schools#search_name', on: :collection, as: 'seach_name'
    get '/:id/courses', to: 'schools#courses', on: :member
  end
  resources :courses do
    get '/search_by_school', to: 'courses#search_by_school', on: :collection, as: 'search_by_school'
  end
end
