class Course < ActiveRecord::Base
  belongs_to :school
  
	has_many :classrooms
  has_many :students, through: :classrooms
  
  before_destroy { students.clear }
  
  validates :title, presence: true
  validates :duration, presence: true
  validates :price, presence: true

  scope :by_school, -> (school_id) { where(school_id: school_id) }
  scope :search_by_title, -> (title) { where("title ILIKE ?", "%#{title}%".gsub(' ','%')) }
  
  def active_students
    students.where(status: true).size
  end
  
  
  
end
