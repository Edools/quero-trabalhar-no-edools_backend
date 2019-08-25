class ApplicationController < ActionController::Base
  include TranslateHelper
  include AlertsHelper

  def view_foto
    send_file(Rails.root.join('app', 'assets', 'images', 'user.jpg'), :type => "image/jpg", :disposition => 'inline')
  end

  # Gera impressão de relatório
  def gerar_relatorio(tipo_relatorio, dados, nome_relatorio, nme_layout = 'imprimir', options = {})
    if tipo_relatorio && tipo_relatorio.present? && TIPOS_IMPRESSAO.include?(tipo_relatorio)
      @tipo_relatorio = tipo_relatorio

      if tipo_relatorio.to_s.upcase == 'PDF'

        html = render_to_string(action: "#{nme_layout.to_s.gsub('.html.erb', '')}.html.erb",
                                layout: options[:layout] || 'relatorios/relatorio_limpo.html.erb')
        kit = PDFKit.new(html,
                         orientation: options[:orientation] || PORTRAIT,
                         print_media_type: true,
                         footer_left: options[:footer_left] || '"Emitido em ' "#{Time.now.strftime("%Y/%m/%d %H:%M:%S")}" '"',
                         footer_center: options[:footer_center] || '"eGESP"',
                         footer_font_size: '8') #:footer_right=>footer_right,
        kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css"
        pdf = kit.to_pdf

        send_data(pdf, filename: "#{nome_relatorio}.pdf", type: 'application/pdf')
      elsif tipo_relatorio.to_s.upcase == 'XLS'
        request.format = 'xls'
        respond_to do |format|
          format.xls { send_data render_to_string(action: "#{nme_layout}.html.erb",
                                                  layout: options[:layout] || 'relatorios/relatorio_limpo.html.erb'), filename: "#{nome_relatorio}.xls" }
        end
      elsif tipo_relatorio.to_s.upcase == 'DOC'
        request.format = 'doc'
        respond_to do |format|
          format.doc { send_data render_to_string(action: "#{nme_layout}.html.erb",
                                                  layout: options[:layout] || 'relatorios/relatorio_limpo.html.erb'), filename: "#{nome_relatorio}.doc" }
        end
      elsif tipo_relatorio.to_s.upcase == 'XML'
        send_data dados.to_xml, filename: "#{nome_relatorio}.xml", type: 'text/xml', disposition: 'attachment'
      elsif tipo_relatorio.to_s.upcase == 'CSV'
        send_data dados.to_csv, filename: "#{nome_relatorio}.csv", type: 'text/csv', disposition: 'attachment'
      elsif tipo_relatorio.to_s.upcase == 'HTML'
        html = render_to_string(action: "#{nme_layout}.html.erb", layout: false)
        send_data html, filename: "#{nome_relatorio}.html", type: 'text/plain', disposition: 'attachment', layout: false
      end
    end
  end

  # Remove atributos não desejados do xml
  def remove_keys(dado)
    dado.except!(:id, :created_at, :updated_at)
  end

  def log(objeto)
    p '########################################### - INICIO - ###########################################'
    p objeto
    p '########################################### - FIM - ###########################################'
  end

  # Adiciona barra de navegação superior
  def add_breadcrumb(name, url = '#', icon = '', menu = name)
    @breadcrumbs ||= []
    url = eval(url) if url =~ /_path|_url|@/
    @breadcrumbs << [name, url, icon, menu]
  end

  def context_path(url)
    URI.join('/' + request.fullpath.split('/')[1], url)
  end

  private

  def prepare_exception_notifier
    request.env["exception_notifier.exception_data"] = {
        :current_user => nil
    }
  end

end
