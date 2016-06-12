class School < ActiveRecord::Base
  validates :name, :email , :pitch, :subdomain, presence: true
  has_many :courses
  validates_format_of :subdomain, with: /\A^[-a-z]+$\z/
  scope :report_student_active, -> (school) { joins(courses: :students).select('students.name').where('students.status = ? AND schools.id = ?', 0, school) }

  private
  def self.search(search)
    if search
      where("name LIKE ?" , "%#{search}%")
    else
      all
    end
  end
end
