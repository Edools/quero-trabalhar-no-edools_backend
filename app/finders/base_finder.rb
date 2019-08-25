# frozen_string_literal: true

# Classe base para os Finders
class BaseFinder
  attr_accessor :options

  # inicializa o objeto
  def initialize(options = {})
    @options = options
  end

  def escolas(q = TbEscola)
    q.includes(:tb_cursos)
  end

  private

  def default_per_page
    @options[:per_page] || TOTAL_REGISTROS
  end
end
