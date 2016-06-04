class Student < ActiveRecord::Base
  has_and_belongs_to_many :courses
	has_many :classrooms
  has_many :courses, through: :classrooms
  
  validates_presence_of :name, :register_number
end
