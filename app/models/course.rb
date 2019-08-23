class Course < ApplicationRecord
  searchkick text_middle: [:tittle]
  validates :tittle, :presence => true
  validates :description, :presence => true
  validates :content, :presence => true
  validates :duration, :presence => true
  validates :price, :presence => true

  has_many :student_courses
end
