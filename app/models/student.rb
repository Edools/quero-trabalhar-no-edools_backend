class Student < ApplicationRecord
  validates :name, :presence => true

  has_many :student_courses
end
