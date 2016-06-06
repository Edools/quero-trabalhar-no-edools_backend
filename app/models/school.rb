class School < ActiveRecord::Base
  has_many :courses, dependent: :destroy
  has_many :students, through: :courses
 
  validates :name, presence: true
  validates :email, presence: true, format: { with: /@/ }
  validates :subdomain, presence: true, format: { with: /\A[a-z0-9-_]+\Z/ }, uniqueness: true
 
  scope :search_by_name, -> (name) { where("name ILIKE ?", "%#{name}%".gsub(' ','%')) }
  
  def active_students
    sum = 0
    courses.map { |x| sum += x.active_students}
    return sum
  end
end
