Rails.application.routes.draw do
  resources :alunos
  resources :cursos
  resources :escolas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/matriculas/:id/curso/:curso_id/aluno/:aluno_id', to: 'home#matricular', via: 'post', as: :matricula_escola_aluno
  match '/matriculas/:id/curso/:curso_id/aluno/:aluno_id', to: 'home#cancelar_matricula', via: 'delete', as: :matricula_escola_aluno_cancela
  match '/matriculas/:id/curso/:curso_id/aluno/:aluno_id', to: 'home#matricula_escola', via: 'get'
  match '/matriculas/:id/curso/:curso_id', to: 'home#matricula_escola', via: 'get', as: :matricula_escola
  match '/matriculas', to: 'home#matriculas', via: 'get'

  get 'home/index'

  root 'home#index'
end
