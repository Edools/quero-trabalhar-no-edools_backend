module ContentHelper
  # Retorna o titulo completo para ser usado na view
  #
  # @param page_title [String] titulo da view
  # @return [String]
  def title(page_title)
    return NOME_DO_ORGAO if page_title.empty?
    "#{page_title} - #{NOME_DO_ORGAO}"
  end

  # Retorna a descrição completa para ser usada na view
  #
  # @param page_description [String] descrição da view
  # @return [String]
  def description(page_description)
    return NOME_DO_ORGAO if page_description.empty?
    "#{page_description} - #{NOME_DO_ORGAO}"
  end

  # Retorna o tema o tema dependendo do usuário logado
  #
  # @return [String]
  def skin_theme
    return 'skin-3' if e_magistrado? || e_magistrado_aposentado?
    'skin-1' if e_estagiario?
  end
end
