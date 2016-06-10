class Student < ActiveRecord::Base
  validates :name, :enrollment, :status, presence: true
  enum status: [:active, :inactive]
  has_many :course_students
  has_many :courses  ,through: :course_students
end
