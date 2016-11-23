class Course < ActiveRecord::Base
  include PgSearch

  belongs_to :school
  has_and_belongs_to_many :students

  scope :with_schools, -> (school) { where(school: school) }
  scope :with_students, -> { joins(:students).select('courses.*, students.name as student_name, students.id as student_id') }
  pg_search_scope :search_by_name, against: :title
end
