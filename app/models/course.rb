class Course < ActiveRecord::Base
  belongs_to :school
  
  has_and_belongs_to_many :students
	has_many :classrooms
  has_many :students, through: :classrooms
  
  validates_presence_of :title, :description, :content, :duration, :price
end
