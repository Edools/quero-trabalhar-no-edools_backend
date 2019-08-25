# frozen_string_literal: true

module PaginateHelper
  # Método de paginação com totalizadores
  #
  # @param qtd_itens [Integer] quantidade total de itens
  # @param qtd_por_pagina [Integer] quantidade de itens por página
  # @param pagina_atual [Integer] página atual
  # @param name_page [String] nome do campo de parametros
  # @param show_per_page [Boolean] exibe o quantificador
  #
  # @return[Html]
  def paginate_password_with_count(qtd_itens, qtd_por_pagina, pagina_atual, name_page = 'page', show_per_page = false)
    if qtd_itens && qtd_itens.present? && qtd_itens.size > 0
      if pagina_atual.nil?
        pagina_atual = 1
      else
        pagina_atual = pagina_atual.to_i
      end
      primeiro_item = qtd_itens > 0 ? ((pagina_atual * qtd_por_pagina) - qtd_por_pagina + 1) : 0
      qtd_max_exibido = pagina_atual * qtd_por_pagina
      qtd_max_exibido = qtd_itens if qtd_max_exibido > qtd_itens

      params = response.request.env['QUERY_STRING'].split('&').reject { |h| h.include?("per_#{name_page}=") }
      url = "#{response.request.env['SCRIPT_NAME']}#{response.request.env['PATH_INFO']}?"
      url += "#{(params.all? &:blank?) ? '' : (params.join('&') + '&')}" unless params.empty?

      "<div class='row'>
          <div class=\"col-md-12\" >
            #{"<div class='col-md-2'>
                <label class='control-label col-md-12'>Exibindo</label>
                <div class='col-md-12'>
                #{select_tag :"per-#{name_page}", options_for_select([['5 registros', 5], ['20 registros', 20],
                                                                      ['100 registros', 100]], qtd_por_pagina),
                             class: 'form-control',
                             onchange: "location.href='#{url}per_#{name_page}='+$(this).find(\"option:selected\").val()" }
                </div>
            </div>" if show_per_page}
            <div class='col-md-3 col-sm-6'>
                <div class='pagination pull-left'>
                  Exibindo #{primeiro_item} - #{qtd_max_exibido} de #{qtd_itens} registro#{"s" if qtd_itens > 1}
                </div>
            </div>
            <div class='col-md-#{show_per_page ? 7 : 9} col-sm-12'>
              <div class='pagination pull-right'>
                 #{paginate_password(qtd_itens, qtd_por_pagina, pagina_atual, name_page)}
              </div>
            </div>
          </div>
    </div>".html_safe
    end
  end

  # Método de customização da Paginação
  #
  # @param qtd_itens [Integer] quantidade total de itens
  # @param qtd_por_pagina [Integer] quantidade de itens por página
  # @param pagina_atual [Integer] página atual
  # @param name_page [String] nome do campo de parametros
  #
  # @return[Html]
  def paginate_password(qtd_itens, qtd_por_pagina, pagina_atual, name_page = 'page')
    total_paginas = (qtd_itens.to_f / qtd_por_pagina.to_f).ceil
    if pagina_atual.nil?
      pagina_atual = 1
    else
      pagina_atual = pagina_atual.to_i
    end

    params = response.request.env['QUERY_STRING'].split('&').reject { |h| h.include? 'page' }
    url = "#{response.request.env['SCRIPT_NAME']}#{response.request.env['PATH_INFO']}?"
    url += "#{(params.all? &:blank?) ? '' : (params.join('&') + '&')}" unless params.empty?

    if pagina_atual > 1
      anterior = "<li class='paginate_button previous disabled' id='DataTables_Table_0_previous'>
                  <a href='#{url}&#{name_page}=#{(pagina_atual - 1)}' ' tabindex='0' data-dt-idx='0'>
                  <span class='fa fa-angle-left'></span> Anterior</a></li>"
    else
      anterior = "<li class='paginate_button previous disabled' id='DataTables_Table_0_previous'><a href='#' tabindex='0' data-dt-idx='0'>
                  <span class='fa fa-angle-left'></span> Anterior</a></li>"
    end

    if pagina_atual < total_paginas
      proximo = "<li><a href='#{url}#{name_page}=#{(pagina_atual + 1)}'>Próximo <span class='fa fa-angle-right'></span></a></li>"
    else
      proximo = "<li class='disabled'><a href='#'>Próximo <span class='fa fa-angle-right'></span></a></li>"
    end

    paginacao = "<ul class='pagination'> "
    if (pagina_atual - 3) > 0 && (pagina_atual - 3) != 1
      paginacao += "<li><a href='#{url}#{name_page}=1'><span class='fa fa-angle-double-left'></span> Primeiro</a></li>"
    end

    paginacao += "#{anterior}"
    pag_anteriores = ''
    for i in 1..3
      pag_anteriores = "<li class=\"paginate_button\"><a href='#{url}#{name_page}=#{(pagina_atual - i)}'>#{(pagina_atual - i)}</a>
                        </li>" + pag_anteriores if (pagina_atual - i) > 0
    end

    paginacao += pag_anteriores
    paginacao += "<li class='footable-page active disabled'><a href='#'>#{pagina_atual}</a></li>"
    for i in 1..3
      if (pagina_atual + i) <= total_paginas
        paginacao += "<li  class=\"paginate_button\"><a href='#{url}#{name_page}=#{(pagina_atual + i)}'>#{(pagina_atual + i)}</a></li>"
      end
    end

    paginacao += " #{proximo}"
    paginacao += "<li class=\"paginate_button next\"><a href='#{url}#{name_page}=#{total_paginas}'>
                  Último <span class='fa fa-angle-double-right'></span></a></li>" if (pagina_atual + 3) < total_paginas

    paginacao += ' </ul>'
    paginacao.html_safe
  end
end