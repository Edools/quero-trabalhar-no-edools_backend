class Course < ApplicationRecord

  belongs_to :school

  validates_presence_of :school, :title, :duration, :duration_unit, :price

  enum duration_unit: [ :hours, :days, :months ]

  scope :by_name, ->(name) { where('name like ?', "%#{name}%") }
end
