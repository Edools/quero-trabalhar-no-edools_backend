class PrincipalController < ApplicationController
  before_action :add_breadcrumb_index
  before_action :carrega_parametros, only: %i(index)

  def index
  end

  private

  def carrega_parametros
    @total_escolas = TbEscola.all.count
    @total_cursos = TbCurso.all.count
    @total_alunos_ativos = TbCurso.all.sum(&:qtd_alunos_ativos)
    @media_custo_cursos = TbCurso.all.average(:preco)
  end

  def add_breadcrumb_index
    add_breadcrumb 'Início', root_path
  end
end
