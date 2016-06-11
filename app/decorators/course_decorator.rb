class CourseDecorator < Draper::Decorator
  delegate_all

  def price
    h.number_to_currency(object.price, unit: 'R$')
  end
end
