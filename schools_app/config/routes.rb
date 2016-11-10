Rails.application.routes.draw do
  root 'home#index'

  resources :courses,     except: [:show]
  resources :enrollments, except: [:show, :edit, :update]
  resources :schools,     except: [:show]
  resources :students,    except: [:show]
end
