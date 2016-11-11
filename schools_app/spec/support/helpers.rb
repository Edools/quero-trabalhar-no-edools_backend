module Helpers
  def submit_form
    find('input[name="commit"]').click
  end

  def submit_form_by_button
    find('button[type="submit"]').click
  end
end
