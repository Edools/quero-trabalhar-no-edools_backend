class StudentDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime("%d/%m/%Y")
  end
end
