Rails.application.routes.draw do
  root 'home#index'

  resources :courses,  except: [:show]
  resources :schools,  except: [:show]
  resources :students, except: [:show]
end
