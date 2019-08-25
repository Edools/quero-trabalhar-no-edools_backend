# frozen_string_literal: true

class TbEscolaDecorator < ApplicationDecorator
  delegate_all

  # Concatena o subdomínio com o domínio da Edools
  #
  # @return[String]
  def subdominio_completo
    "#{self.subdominio}.edools.com"
  end

  # Retorna todos os cursos em uma lista
  #
  # @return[Html]
  def lista_cursos
    h.content_tag :ul do
      self.tb_cursos.map { |curso| h.content_tag :li, curso.titulo }.join('').html_safe
    end
  end

  # Retorna a quantidade de todos os alunos de uma escola
  #
  # @return[Integer]
  def qtd_alunos_ativos
    self.tb_cursos.sum(&:qtd_alunos_ativos)
  end
end
