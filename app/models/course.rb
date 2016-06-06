class Course < ActiveRecord::Base
  belongs_to :school

  validates_presence_of :title, :description, :content, :duration, :active_students, :price
  validates :price, numericality: { greater_than_or_equal_to: 0.1 }
  validates :active_students, numericality: { greater_than_or_equal_to: 0 }
end
