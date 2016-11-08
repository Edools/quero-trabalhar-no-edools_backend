Rails.application.routes.draw do
  scope 'rest/v1', module: 'rest/v1', defaults: { format: :json } do
    resources :schools do
      member do
        get 'students', to: 'schools#count_active_students'
      end

      collection do
        get 'search'
      end

      resources :courses
    end
  end
end
