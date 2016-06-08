class Course < ActiveRecord::Base
  belongs_to :school
  has_many :enrollments
  has_many :students, through: :enrollments

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :content, presence: true
  validates :duration, presence: true
  validates :price, presence: true, numericality: true
  validates_associated :students
end
