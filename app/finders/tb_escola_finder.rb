# frozen_string_literal: true

class TbEscolaFinder < BaseFinder
  attr_accessor :options

  # Initializer
  def initialize(options = {})
    @options = options
    @q = TbEscola.ransack(@options[:q])
  end

  # Retorna todos os elementos, ou apenas filtragem por paginação, das escolas
  #
  # @return[Array]
  def all
    @options[:paginate].present? ?
        result = escolas(@q.result(distinct: true)).paginate(per_page: TOTAL_REGISTROS, page: @options[:page]) :
        result = escolas(@q.result(distinct: true))
    [@q, result]
  end
end
