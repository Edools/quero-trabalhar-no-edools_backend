Rails.application.routes.draw do
  root 'welcome#index', path: 'bem-vindo'

  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :schools, path: 'escolas'
    resources :courses, path: 'cursos'
  end
end
