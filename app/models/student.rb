class Student < ActiveRecord::Base
	has_many :classrooms
  has_many :courses, through: :classrooms
  
  before_destroy { courses.clear }
  
  validates_presence_of :name, :register_number
  
  scope :by_course, -> (course_id) { joins(:courses).where( courses: { id: course_id }) }
  
  def status_value
		self.status == true ? "Ativo" : "Inativo"
	end
end
