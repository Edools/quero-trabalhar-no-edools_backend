# frozen_string_literal: true

class Util
  ID_STATUS_NAO_DEFERIDO = 0
  ID_STATUS_DEFERIDO = 1
  ID_STATUS_EM_ANALISE = 2
  ID_STATUS_HISTORICO = 3
  ID_STATUS_EFEITO_FINANCEIRO = 4
  ID_CANCELADO = 5
  ID_ALTERADO = 7

  def self.format_number_SEI(number)
    number.to_s.gsub(/(\d{2})(\d{1})(\d{9})(\d{1})/, '\1.\2.\3-\4')
  end

  def self.extension_filename(file_name)
    if file_name && File.extname(file_name) && File.extname(file_name).present?
      return File.extname(file_name).strip.downcase[1..-1]
    else
      return "PDF"
    end
  end

  # :need-doc:
  def self.ref_anomes_atual(cdg_orgao = CDG_ORGAO)
    parametro = RecursosHumanos::Tbparametro.ref_anomes_atual(cdg_orgao)
    parametro.ref_anomes if parametro
  end

  # Retorna o anomes com base na data atual
  def self.anomes
    "#{Date.today.year}#{Date.today.month.to_s.rjust(2, '0')}".to_i
  end

  DIAS_SEMANA =
      { 1 => 'Segunda-Feira',
        2 => 'Terça-Feira',
        3 => 'Quarta-Feira',
        4 => 'Quinta-Feira',
        5 => 'Sexta-Feira',
        6 => 'Sabado',
        0 => 'Domingo' }

  # :need-doc:
  def self.cripotografia(dataAtual, url, method = 'POST')
    key = 'e249c439ed7697df2a4b045d97d4b9b7e1854c3ff8dd668c779013653913572e'
    data = '3441df0babc2a2dda551d7cd39fb235bc4e09cd1e4556bf261bb49188f548348' + method + url + dataAtual.to_s
    p '##### Codigo FREQUENCIA ###'
    p dataAtual
    p data
    digest = OpenSSL::Digest::Digest.new('sha256')
    OpenSSL::HMAC.hexdigest(digest, key, data)
  end

  # :need-doc:
  def self.true_or_false(valor)
    if valor
      valor.to_i == 1
    else
      false
    end
  end

  # Mêses entre duas datas
  def self.months_between(date1, date2)
    months1 = date1.year * 12 + date1.month
    months2 = date2.year * 12 + date2.month
    months1 - months2
  end

  # Lista de AnoMês entre duas datas
  def self.lista_anomes_entre_duas_datas(dta_inicio, dta_fim)
    return [] if dta_inicio.blank? || dta_fim.blank? || dta_fim < dta_inicio
    arr_anomes = []
    dta_fim.downto(dta_inicio) do |dta_atual|
      arr_anomes << dta_atual.strftime('%Y%m').to_i unless arr_anomes.include?(dta_atual.strftime('%Y%m').to_i)
    end
    arr_anomes.sort!
  end

  # :need-doc:
  def self.encrypt(data)
    return unless data
    URLcrypt.encrypt(data.to_s)
  end

  # :need-doc:
  def self.formata_nota_str(valor)
    if valor && valor.present?
      begin
        return (valor.to_s[0..3]).to_s.gsub('.', ',')
      rescue
        return Dinheiro.new(valor.to_s.to_f).to_s.gsub('.', '')
      end
    else
      '0,00'
    end
  end

  # :need-doc:
  def self.decrypt(data)
    return if data.blank?
    URLcrypt.decrypt(data.to_s)
  end

  # :need-doc:
  def self.format_date_to_str(data)
    if data && data.present?
      data.strftime('%d/%m/%Y').to_s
    else
      ''
    end
  end

  # :need-doc:
  def self.format_date_to_str_with_sql(data)
    if data && data.present?
      "TO_DATE('#{format_date_to_str(data)}','DD/MM/YYYY')"
    else
      ''
    end
  end

  # :need-doc:
  def self.format_date_to_str_with_sql_str(data_str)
    if data_str && data_str.present?
      "TO_DATE('#{data_str}','DD/MM/YYYY')"
    else
      ''
    end
  end

  # :need-doc:
  def self.format_ref_anomes(ref_anomes)
    return if ref_anomes.to_s.strip.length != 6
    begin
      if ref_anomes
        data = Date.new(ref_anomes.to_s.at(0..3).to_i, ref_anomes.to_s.at(4..5).to_i, 1)
        I18n.localize(data, format: '%B/%Y')
      end
    rescue
      ''
    end
  end

  # no-doc
  def self.format_ref_anomes_str(ref_anomes)
    return nil if ref_anomes.nil? || (ref_anomes.to_s.size != 6)
    if ref_anomes && ref_anomes.present?
      data = Date.new(ref_anomes.to_s.at(0..3).to_i, ref_anomes.to_s.at(4..5).to_i, 1)
      ref_anomes_formatada = I18n.l(data, format: '%B/%Y')
    end
    ref_anomes_formatada
  end

  # :need-doc:
  def self.format_ref_anomes_str_order(ref_anomes)
    return nil if ref_anomes.nil? || (ref_anomes.to_s.size != 6)
    if ref_anomes && ref_anomes.present?
      data = Date.new(ref_anomes.to_s.at(0..3).to_i, ref_anomes.to_s.at(4..5).to_i, 1)
      ref_anomes_formatada = I18n.l(data, format: '%Y/%B')
    end
    ref_anomes_formatada
  end

  # :need-doc:
  def self.format_ref_anomes_str_compl(ref_anomes)
    if ref_anomes
      data = Date.new(ref_anomes.to_s.at(0..3).to_i, ref_anomes.to_s.at(4..5).to_i, 1)
      ref_anomes_formatada = I18n.l(data, format: '%B de %Y')
    end
    ref_anomes_formatada
  end

  # :need-doc:
  def self.converter_dias_tempo_por_extenso(dias)
    if dias && dias.present?
      sql = "SELECT #{SCHEMA_NAME}.SF_DIAS_TO_TEMP_EXTENSO(#{dias.to_i}) AS TEMPO FROM DUAL"
      resultado = ActiveRecord::Base.connection.execute(sql).fetch.first
    end
  end

  # :need-doc:
  def self.valor_por_extenso(valor)
    if valor && valor.present?
      sql = "SELECT #{SCHEMA_NAME}.SF_VALOR_POR_EXTENSO(#{valor.to_i}) AS VALOR FROM DUAL"
      resultado = ActiveRecord::Base.connection.execute(sql).fetch.first
    end
  end

  # :need-doc:
  def self.converter_data_ano_mes(data)
    ano_mes = data.year.to_s + data.strftime('%m').to_s.rjust(2, '0')
    ano_mes.to_i
  end

  # :need-doc:
  def self.converter_ref_anomes_to_date(ref_anomes)
    if ref_anomes
      data = DateTime.new(ref_anomes.to_s.at(0..3).to_i, ref_anomes.to_s.at(4..5).to_i, 1)
      data.to_date
    else
      nil
    end
  end

  # :need-doc:
  def self.monta_ref_anomes(ano, mes)
    ref_anomes = nil
    if ano && mes
      ref_anomes = (ano.to_s.ljust(4, '0').to_s + mes.to_s.rjust(2, '0')).to_i
    end
  end

  # :need-doc:
  def self.converter_ref_anomes_to_date_with_next_referencia(ref_anomes)
    if ref_anomes
      ref_anomes = next_ref_anomes(ref_anomes)
      ref_anomes = converter_ref_anomes_to_date(ref_anomes)
      ref_anomes
    else
      nil
    end
  end

  # :need-doc:
  def self.extrair_ano_ref_anomes(ref_anomes)
    if ref_anomes
      return ref_anomes.to_s.at(0..3).to_i
      data = DateTime.new(ref_anomes.to_s.at(0..3).to_i, ref_anomes.to_s.at(4..5).to_i, 1)
    end
  end

  # :need-doc:
  def self.extrair_mes_ref_anomes(ref_anomes)
    if ref_anomes
      return ref_anomes.to_s.at(4..5).to_i
    end
  end



  # :need-doc:
  def self.ref_anomes_anterior(ref_anomes)
    ref_anomes_ant = nil
    if ref_anomes
      mes = ref_anomes.to_s.at(4..5).to_i
      ano = ref_anomes.to_s.at(0..3).to_i
      if mes == 1
        ano = ano - 1
        mes = 12
      else
        mes = mes - 1
      end

      ref_anomes_ant = ano.to_s.rjust(4, '0') + mes.to_s.rjust(2, '0')
    end
    ref_anomes_ant.to_i
  end

  # :need-doc:
  def self.criar_data(dia, mes, ano)
    data = DateTime.now
    data = data.to_date.change(day: dia)
    data = data.to_date.change(month: mes)
    data = data.to_date.change(year: ano)
    data
  end

  # :need-doc:
  def self.primeiro_dia_ano(ano)
    data = DateTime.now
    data = data.to_date.change(day: 1)
    data = data.to_date.change(month: 1)
    data = data.to_date.change(year: ano)
    data
  end

  # :need-doc:
  def self.primeiro_dia_do_mes(ref_anomes)
    data = DateTime.now
    data = data.to_date.change(day: 1)
    data = data.to_date.change(month: ref_anomes.to_s.at(4..5).to_i)
    data = data.to_date.change(year: ref_anomes.to_s.at(0..3).to_i)
    data
  end

  # :need-doc:
  def self.subtrair_year_date(data, qtd_anos)
    data - qtd_anos.year
  end

  # :need-doc:
  def self.add_year_date(data, qtd_anos)
    data.to_date + qtd_anos.year
  end

  # :need-doc:
  def self.proxima_data_inicio_solicitacao_ferias
    data = DateTime.now.to_date
    data = definir_data_do_mes_pelo_dia(1)
    data = add_mes_to_date(data, 2)
    data
  end

  # :need-doc:
  def self.definir_data_do_mes_pelo_dia (dia)
    DateTime.now.to_date.change(day: dia)
  end

  # :need-doc:
  def self.add_mes_to_date (data, qtd_meses)
    data.months_since(qtd_meses)
  end

  # :need-doc:
  def self.add_day_to_date (data, qtd_day)
    if qtd_day && qtd_day.present? && (qtd_day.to_i > 0)
      data + qtd_day.days
    else
      data
    end
  end

  # :need-doc:
  def self.next_ref_anomes(ref_anomes)
    proximo_ref_anomes = nil
    if ref_anomes
      mes = ref_anomes.to_s.at(4..5).to_i
      ano = ref_anomes.to_s.at(0..3).to_i
      if mes == 12
        ano = ano + 1
        mes = 1
      else
        mes = mes + 1
      end

      proximo_ref_anomes = ano.to_s.rjust(4, '0') + mes.to_s.rjust(2, '0')
    end
    proximo_ref_anomes.to_i
  end

  # :need-doc:
  def self.previous_ref_anomes(ref_anomes)
    anterior_ref_anomes = nil
    if ref_anomes
      mes = ref_anomes.to_s.at(4..5).to_i
      ano = ref_anomes.to_s.at(0..3).to_i
      if mes == 1
        ano = ano - 1
        mes = 12
      else
        mes = mes - 1
      end

      anterior_ref_anomes = ano.to_s.rjust(4, '0') + mes.to_s.rjust(2, '0')
    end
    anterior_ref_anomes.to_i
  end

  def self.proximo_codigo(nome_tabela, nome_chave)
    x = RecursosHumanos::TbCadPessoal.find_by_sql("SELECT max(#{nome_chave}) as id from #{nome_tabela} ").first
    return x[:id].to_i + 1
  end

  # Retorna o próximo valor da sequence
  def self.proximo_codigo_sequence(nome_sequence)
    if ActiveRecord::Base.connection.adapter_name == 'OracleEnhanced'
      x = RecursosHumanos::TbCadPessoal.find_by_sql("SELECT #{nome_sequence}.nextval as id from dual").first
    else
      x = RecursosHumanos::TbCadPessoal.find_by_sql("SELECT nextval('#{nome_sequence}') as id").first
    end
    x[:id].to_i
  end

  # :need-doc:
  def self.symbolize_keys(hash)
    new = {}
    hash.map do |key, value|
      if value.is_a?(Hash)
        value = symbolize_keys(value)
      end
      new[key.to_sym] = value
    end
    new
  end

  # :need-doc:
  def self.downcase_hash_keys_list(lista)
    lista.each { |e| e = downcase_hash_keys(e).symbolize_keys }
    lista.each do |h|
      h.keys.each { |k| h[k.to_sym] = h.delete(k) }
    end
  end

  # :need-doc:
  def self.downcase_hash_keys(h)
    if h.is_a?(Hash)
      h.keys.each do |key|
        new_key = key.to_s.downcase
        h[new_key] = h.delete(key)
        downcase_hash_keys(h[new_key])
      end
    elsif h.respond_to?(:each)
      h.each { |e| downcase_hash_keys(e) }
    end
    h
  end

  # :need-doc:
  def self.lowercase_keys(h)
    new_h = {}
    h.each_pair do |k, v|
      new_k = deep_lowercase(k, true)
      new_v = deep_lowercase(v, false)
      new_h[new_k] = new_v
    end
    new_h
  end

  # :need-doc:
  def self.deep_lowercase(object, with_strings)
    case object
    when String then
      with_strings ? object.downcase : object
    when Hash then
      lowercase_keys(object)
    else
      object.respond_to?(:map) ? object.map { |e| deep_lowercase(e, false) } : object
    end
  end

  # :need-doc:
  def self.escala_ferias_ativo?(configuracao_data_escala_ferias, tipo)
    if tipo == 'SOLICITAR'
      if configuracao_data_escala_ferias && configuracao_data_escala_ferias.dta_ini_solicitacao && configuracao_data_escala_ferias.dta_fim_solicitacao && is_date_dentro_intervalo?(configuracao_data_escala_ferias.dta_ini_solicitacao, configuracao_data_escala_ferias.dta_fim_solicitacao, DateTime.now)
        true
      else
        false
      end
    elsif tipo == 'AUTORIZAR'
      if configuracao_data_escala_ferias && configuracao_data_escala_ferias.dta_ini_autor_sol && configuracao_data_escala_ferias.dta_fim_autor_sol && is_date_dentro_intervalo?(configuracao_data_escala_ferias.dta_ini_autor_sol, configuracao_data_escala_ferias.dta_fim_autor_sol, DateTime.now)
        true
      else
        false
      end
    else
      false
    end
  end

  # :need-doc:
  def self.is_date_dentro_intervalo?(data_inicio, data_fim, data_comparacao)
    if data_inicio && data_fim && data_comparacao
      (data_inicio.to_date..data_fim.to_date).include?(data_comparacao.to_date)
    else
      false
    end
  end

  # Abre excel
  def self.open_excel(path)
    case File.extname(path)
    when '.csv' then
      Roo::Csv.new(path, nil, :ignore)
    when '.xls' then
      Roo::Excel.new(path)
    when '.xlsx' then
      Roo::Excelx.new(path)
    else
      raise "Formato inválido. Somente arquivos xls, xlsx ou csv. #{path}"
    end
  end

  # :need-doc:
  def self.open_spreadsheet(file)
    rows = []
    case File.extname(file.original_filename)
    when '.csv' then
      Roo::Csv.new(file.path, nil, :ignore)
    when '.xls' then
      rows = Spreadsheet.open(file.path).worksheets.first.rows
      # Spreadsheet.open(file.tempfile.to_path.to_s) #Roo::Spreadsheet.open(file.tempfile.to_path.to_s, extension: :xls) # Roo::Excel.open(file.tempfile.to_path.to_s) #Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then
      objeto = Roo::Spreadsheet.open(file.tempfile.to_path.to_s, extension: :xlsx) # Roo::Excelx.new(file.path, nil, :ignore)
      rows = objeto.sheet(0)
    else
      raise "Unknown file type: #{file.original_filename}"
    end
    rows
  end

  # :need-doc:
  def self.e_membro_by_param?(tb_dados_funcionais)
    if tb_dados_funcionais && tb_dados_funcionais[:grupocargo] && (tb_dados_funcionais[:grupocargo] == 'M')
      true
    elsif tb_dados_funcionais && tb_dados_funcionais[:cdg_sitfunc] && (tb_dados_funcionais[:cdg_sitfunc] ==
        RecursosHumanos::Tbsitfunc::ID_MAGISTRADO)
      true
    else
      false
    end
  end

  # :need-doc:
  def self.e_membro_by_param_financeiro?(financeiro_contra_cheque)
    financeiro_contra_cheque.cdg_sitfunc == RecursosHumanos::Tbsitfunc::ID_MAGISTRADO
  end

  # :need-doc:
  def self.e_desembargador_by_param?(tb_dados_funcionais)
    if tb_dados_funcionais && tb_dados_funcionais[:grupocargo] && (tb_dados_funcionais[:grupocargo] == 'M') && tb_dados_funcionais[:cdg_cargo_efetivo] && (tb_dados_funcionais[:cdg_cargo_efetivo].to_i == CDG_CARGO_EFETIVO_DESEMBARGADOR)
      true
    else
      false
    end
  end

  # :need-doc:
  def self.permissao_cadastro_fiad(valor)
    if valor && valor.present? && (valor.to_i == 1)
      true
    else
      false
    end
  end

  # :need-doc:
  def self.formata_moeda_sem_ponto(valor)
    if valor && (valor > 0)
      valor.to_f.to_s.gsub('.', ',')
    else
      '0,00'
    end
  end

  # :need-doc:
  def self.formata_moeda_com_cifrao(valor)
    if valor && (valor > 0)
      Dinheiro.new(valor.to_s.to_f).real_formatado
    else
      Dinheiro.new(0).real_formatado
    end
  end

  # :need-doc:
  def self.create_a_directory(dir_name)
    if dir_name
      # dir_name was specified, ensure it is created and writable.
      unless File.exist?(dir_name)
        begin
          FileUtils.mkdir_p(dir_name)
        rescue Errno::EACCES => e
          abort "Erro ao criar diretorio #{dir_name}: #{e.message}"
        end
      end
    end
  end

  # :need-doc:
  def self.copy_with_path(src, dst)
    create_a_directory(dst)
    FileUtils.cp(src, dst)
  end

  # :need-doc:
  def self.create_file_zip(source_path, path, files)
    Zip::ZipFile.open(path, Zip::ZipFile::CREATE) do |z|
      files.each do |file|

        expand_dirs(file).each do |dir|
          begin
            z.mkdir dir
          rescue Errno::EEXIST
          end
        end
        z.add file, source_path
      end
    end
  end

  # :need-doc:
  def self.nvl(valor, retorno = 0)
    unless valor && valor.present?
      retorno
    else
      valor
    end
  end

  # :need-doc:
  def self.log(objeto)
    p '########################################### - INICIO - ###########################################'
    p objeto
    p '########################################### - FIM - ###########################################'
  end

  # :need-doc:
  def self.label_selecionado_no_enum(lista, value, value_check)
    item = nil
    if lista && (lista.size > 0) && value_check
      lista.each do |dado|
        if dado["#{value}".to_sym] == value_check
          item = dado
          break
        end
      end
    end
    if item
      return item[:label]
    end
  end

  # Próximo código da sequence
  def self.proximo_codigo_sequence(nome_sequence)
    if ActiveRecord::Base.connection.adapter_name == 'OracleEnhanced'
      x = ActiveRecord::Base.connection.exec_query("SELECT #{nome_sequence}.nextval as id from dual").first
    else
      x = ActiveRecord::Base.connection.exec_query("select nextval('#{nome_sequence}'::regclass) as id").first
    end
    x['id'].to_i
  end

  # :need-doc:
  def self.sanitize_filename(file_name)
    if file_name && File.extname(file_name) && File.extname(file_name).present?
      just_filename = File.basename(file_name)
      just_filename.sub(/[^\w\.\-]/, '_')
      just_filename = just_filename.strip
      just_filename = just_filename.gsub(File.extname(just_filename).strip.downcase[1..-1], '')
      just_filename = just_filename.gsub('.', '')
      just_filename = just_filename.gsub('(', '')
      just_filename = just_filename.gsub(')', '')
      just_filename = just_filename.gsub('-', '_')
      just_filename = just_filename.gsub(' ', '_')
      just_filename
    else
      file_name
    end
  end

  # extension filename
  def self.extension_filename(file_name)
    if file_name && File.extname(file_name) && File.extname(file_name).present?
      File.extname(file_name).strip.downcase[1..-1]
    else
      'PDF'
    end
  end

  # nvl or coalesce
  def self.nvl_or_coalesce
    if ActiveRecord::Base.connection.adapter_name == 'OracleEnhanced'
      'nvl'
    else
      'coalesce'
    end
  end

  def self.cast_to_varchar
    if ActiveRecord::Base.connection.adapter_name == 'OracleEnhanced'
      return ''
    else
      return '::varchar'
    end
  end

end
