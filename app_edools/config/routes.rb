Rails.application.routes.draw do

  scope "(:locale)", locale: /en|pt\-BR/ do
    resources :schools do
      resources :courses, :students
    end
  end

  get '/:locale' => 'schools#index', locale: /en|pt\-BR/
  root 'schools#index'

  post "/:locale/schools/:id/courses/new" => "courses#create"
  patch "/:locale/schools/:id/courses/:id/edit" => "courses#update"
  post "/:locale/schools/:id/students/new" => "students#create"
  patch "/:locale/schools/:school_id/students/:id/edit" => "students#update"
  delete "/:locale/schools/:school_id/students" => "students#destroy"
end
