Edools::Application.routes.draw do
  root "pages#index"

  resources :students, only: [:show, :new, :create, :edit]
  resources :schools


  resources :courses, only: [:show, :new, :create]
  resources :courses do
  	resources :lessons, only: [:index, :create, :new, :show, :edit, :destroy] 
  end


  get "pages/index"
  get "pages/discovery"

  get '/join/:course_id', to: 'courses#join_course', as: 'join_course'


  devise_for :users, controllers: { sessions: 'users/sessions' }
end
