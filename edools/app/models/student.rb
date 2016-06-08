class Student < ActiveRecord::Base
  belongs_to :school
  has_many :enrollments
  has_many :courses, through: :enrollments
end
