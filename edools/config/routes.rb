Rails.application.routes.draw do
  resources :alunos
  resources :cursos
  resources :escolas
  resources :relatorios
  root to: 'sites#index'
  get 'search_escola', to: 'escola#search'
  get 'search_curso', to: 'curso#search'

  get 'relatorio_cursos', to: 'relatorios#relatorio_cursos'
  get 'relatorio_alunos', to: 'relatorios#relatorio_alunos'
end
