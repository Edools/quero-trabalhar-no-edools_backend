Rails.application.routes.draw do
  root to: 'home#index'

  resources :schools
  resources :courses

  scope module: 'reports' do
    get 'reports/schools', to: 'schools#index'
  end
end
