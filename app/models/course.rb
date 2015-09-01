class Course < ActiveRecord::Base
  belongs_to :school

  validates :title, presence: true
  validates :duration, presence: true
  validates :active_students, presence: true
  validates :price, presence: true
  validates :creation_date, presence: true

  scope :by_school, -> (school_id) { where(school_id: school_id) }
  scope :search_by_title, -> (title) { where("title ILIKE ?", "%#{title}%".gsub(' ','%')) } 

end
