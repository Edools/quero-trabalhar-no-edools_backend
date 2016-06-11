Rails.application.routes.draw do
  root 'welcome#index', path: 'bem-vindo'

  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :schools, path: 'escolas' do
    end
    resources :courses, path: 'cursos' do
      get 'filter', path: 'filtrar', on: :collection      
    end
  end
end
