class Course < ApplicationRecord
  belongs_to :school

  has_many :enrollments
  has_many :students, through: :enrollments

  validates :title, :school, :description, :content, :duration, :price, presence: true
end
