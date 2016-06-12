class RelatoriosController < ApplicationController

  def index
    @escolas = Escola.all
  end

  def relatorio_alunos
    @escola = Escola.find(params[:escola_id])
  end

  def relatorio_cursos
    @escola = Escola.find(params[:escola_id])
  end

end