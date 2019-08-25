# frozen_string_literal: true

module ComponentsHelper
  # Renderiza um componente genérico
  # @param [String] folder: pasta do componente
  # @param [String] name: nome do componente
  # @params *Options hash de opções
  # @params &block bloco do componente
  # @return Componente
  def component(folder, name, *options, &block)
    render("components/#{folder}/#{name}", options: options.first, &block)
  end

  # Renderiza o componente de painel com form
  # @params *Options hash de opções
  # @params &block bloco do componente
  # @return Componente
  def panel_with_form(*options, &block)
    component(:panel, :panel_new_edit, options.first)
  end

  # Renderiza o componente de painel com header
  # @params *Options hash de opções
  # @params &block bloco do componente
  # @return Componente
  def panel_header_filter(filter_open = false, title = 'Filtros')
    options = { title: title, filter_open: filter_open }
    component(:panel, :panel_header_filter, options)
  end

  # Renderiza o componente de painel com header new e edit
  # @params *Options hash de opções
  # @params &block bloco do componente
  # @return Componente
  def panel_header_with_render_new_edit(title = '')
    options = { title: title }
    component(:panel, :panel_header_new_edit, options)
  end

  # Renderiza o componente de painel com header
  # @params *Options hash de opções
  # @params &block bloco do componente
  # @return Componente
  def panel_header(title, list_button=[], imprimir=false)
    options = { title: title, links: list_button, imprimir: imprimir }
    component(:panel, :panel_header, options)
  end

  # Renderiza o componente de date_picker para inserção de datas
  # @params *Options hash de opções
  # @params &block bloco do componente
  # @return Componente
  def date_picker(form, field, *options)
    render("components/date_picker/default", form: form, field: field, options: options.first)
  end

  # Renderiza o componente de date_picker para inserção de datas
  # @params *Options hash de opções
  # @params &block bloco do componente
  # @return Componente
  def date_picker_ransack(form, field, *options)
    render("components/date_picker/ransack", form: form, field: field, options: options.first)
  end

  # Renderiza o componente de date_picker com layout material design para inserção de datas
  # @params *Options hash de opções
  # @params &block bloco do componente
  # @return Componente
  def material_picker(form, field, *options)
    render("components/date_picker/material_default", form: form, field: field, options: options.first)
  end

  # @param cdg_ordem [Fixnum] matricula do servidor
  # @param dado_funcional_api [Hash] cache ou dados funcionais já instanciado
  def box_dados_funcionais_lite(cdg_ordem, dado_funcional_api = nil)
    dado_funcional_api ||= procura_dados(cdg_ordem)
    render 'layouts/components/dados_funcionais_lite', dado_funcional_api: dado_funcional_api if dado_funcional_api
  end

  # Renderiza o componente de datatable utilizando implementando a requisição de dados via ajax
  # @param source Path do datatable source
  # @param columns array contendo as colunas da tabela
  # @param options |Hash| de opções
  # @param &block bloco do componente
  # @return Componente
  def datatable_ajax(source, columns = [], options = {}, &block)
    render("components/datatable/ajax", source: source, columns: columns, options: options.first, &block)
  end

  protected

  def procura_dados(cdg_ordem)
    dado_funcional_atual = RecursosHumanos::TbDadosFuncionaisAtuais.where(cdg_ordem: cdg_ordem).first

  end

  def requisito_cargo(cdg_cargo)
    RequisitoCargo.includes(:recursos_humanos_tbgrau_instrucao, :tb_cursos)
        .where(cdg_cargo: cdg_cargo).first
  end
end
