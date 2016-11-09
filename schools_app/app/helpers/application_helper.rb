module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '', base_title = 'Desafio Edools')
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  # Returns the correct bootstrap class to each flash message type
  def alert_class(type)
    case type.to_sym
    when :error, :errors, :alert
      'alert-danger'
    when :success, :notice
      'alert-success'
    when :warning
      'alert-warning'
    else
      'alert-info'
    end
  end
end
