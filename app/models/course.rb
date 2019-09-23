class Course < ApplicationRecord

  belongs_to :school

  validates_presence_of :school, :title, :duration, :duration_unit, :price

  enum duration_unit: [ :hours, :days, :months ]

end
