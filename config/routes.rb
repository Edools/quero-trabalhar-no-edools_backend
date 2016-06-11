Rails.application.routes.draw do


  root 'welcome#index', path: 'bem-vindo'
  get 'reports',        path: 'relatorios', to: 'reports#index'    

  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :schools, path: 'escolas'
    resources :courses, path: 'cursos' do
      get 'filter', path: 'filtrar', on: :collection
    end
  end
end
