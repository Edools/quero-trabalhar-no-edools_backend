module CrudHelper
  def link_to_new(model, url, html_options = {})
    html_options.reverse_merge!(class: 'button expand success')

    link_to url, html_options do
      html = content_tag(:i, '', class: 'fa fa-plus')
      html << ' '
      html << content_tag(:span, t('views.crud.new', model: model.model_name.human))
      html
    end
  end
end