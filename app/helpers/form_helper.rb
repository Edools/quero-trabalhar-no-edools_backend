module FormHelper
  def errors_for(form, field)
    content_tag(
      :p, form.object.errors[field].try(:first), class: 'help-block error'
    )
  end

  def form_group_for(form, field, &block)
    has_errors = form.object.errors[field].present?

    content_tag :div, class: "form-group #{'has-error' if has_errors}" do
      concat form.label(get_model_translation(form, field), class: 'form-label')
      concat capture(&block)
      concat errors_for(form, field)
    end
  end
  private

  def get_model_translation(form, att)
    form.object_name.singularize.classify.constantize.human_attribute_name(att)
  end
end
