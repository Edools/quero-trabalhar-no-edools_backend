Rails.application.routes.draw do
  resources :schools
  resources :courses, except: [:new, :create]
  get 'pesquisar_escolas', to: 'schools#pesquisar_escolas', as: "pesquisar_escolas"
  get 'pesquisar_cursos', to: 'courses#pesquisar_cursos', as: "pesquisar_cursos"
  get 'pesquisar_cursos_escola', to: 'courses#pesquisar_cursos_escola', as: "pesquisar_cursos_escola"
  get 'relatorio_ativos', to: 'schools#relatorio_ativos', as: "relatorio_ativos"
  get 'pesquisar_cursos_preco', to: 'courses#pesquisar_cursos_preco', as: "pesquisar_cursos_preco"
  root "static#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
