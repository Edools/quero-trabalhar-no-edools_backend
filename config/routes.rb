Rails.application.routes.draw do

  root 'principal#index'

  resources :tb_escolas, path: :escolas
  get 'relatorios/alunos_ativos', to: 'relatorios#alunos_ativos', as: :alunos_ativos
end
