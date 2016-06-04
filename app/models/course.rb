class Course < ActiveRecord::Base
  attr_internal_reader(:active_students)
  belongs_to :school
  
  has_and_belongs_to_many :students
	has_many :classrooms
  has_many :students, through: :classrooms
  

  validates :title, presence: true
  validates :duration, presence: true
  validates :price, presence: true

  scope :by_school, -> (school_id) { where(school_id: school_id) }
  scope :search_by_title, -> (title) { where("title ILIKE ?", "%#{title}%".gsub(' ','%')) }
  
  def active_students
    students.size
  end
  
end
