class RelatoriosController < ApplicationController
  before_action :add_breadcrumb_modulo

  # GET relatorios/alunos_ativos
  def alunos_ativos
    add_breadcrumb breadcrumb('administracao.relatorios.alunos'),
                   alunos_ativos_path

    @q, @tb_escolas = TbEscolaFinder.new(params)
                          .all
  end

  private

  def add_breadcrumb_modulo
    add_breadcrumb breadcrumb('administracao.relatorios.base')
  end

end
