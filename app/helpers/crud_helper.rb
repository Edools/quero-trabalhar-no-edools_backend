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

  def link_to_edit(url, html_options = {})
    html_options.reverse_merge!(class: 'edit')

    link_to t('views.crud.edit'), url, html_options
  end

  def link_to_destroy(url, html_options = {})
    html_options.reverse_merge!(data: { confirm: t('views.crud.confirm') },
                                  method: :delete,
                                  class: 'delete')

    link_to t('views.crud.destroy'), url, html_options
  end
end