Rails.application.routes.draw do
  root 'home#index'

  resources :courses,     except: [:show]
  resources :enrollments, except: [:show, :edit, :update]
  resources :schools,     except: [:show] do
    member do
      get 'report', to: 'schools#create_report'
    end
  end
  resources :students,    except: [:show]
end
