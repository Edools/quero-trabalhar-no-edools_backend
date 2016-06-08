class Course < ActiveRecord::Base
  belongs_to :school
  has_many :enrollments
  has_many :students, through: :enrollments
end
