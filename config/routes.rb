Rails.application.routes.draw do
  get 'static_pages/index'

  root 'static_pages#index'

  resources :schools, only: [:index, :new, :create, :show, :destroy]
end
