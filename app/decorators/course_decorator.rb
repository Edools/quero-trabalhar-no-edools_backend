class CourseDecorator < Draper::Decorator
  delegate_all

  def price
    h.number_to_currency(object.price, unit: 'R$')
  end

  def created_at
    object.created_at.strftime("%d/%m/%Y")
  end

end
