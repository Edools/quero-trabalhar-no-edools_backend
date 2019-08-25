ActionController::Base.asset_host = Proc.new { |source, request|
  if request.env["REQUEST_PATH"].include? ".pdf"
    p "Abrindo PDF: file://#{Rails.root.join('public')}"
    "file://#{Rails.root.join('public')}"
  else
    "#{request.protocol}#{request.host_with_port}"
  end
}

ENV['RAILS_RELATIVE_URL_ROOT'] = '/'
Rails.application.config.assets.precompile += %w( favicon.ico )
Rails.application.config.assets.precompile += %w(favicon/favicon.ico)
Rails.application.config.assets.precompile += %w( organograma.css )
