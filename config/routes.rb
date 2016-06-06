Rails.application.routes.draw do
  root to: 'pages#home'

  resources :schools do
    resources :courses
  end
end
