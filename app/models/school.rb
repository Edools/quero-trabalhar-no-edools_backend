class School < ActiveRecord::Base
  include PgSearch

  has_many :courses, dependent: :destroy
  belongs_to :user

  scope :with_user, -> (user) { where(user: user).order(:id, :updated_at)  }
  scope :active_students, -> (school) {
    joins(courses: :students)
      .select('students.name')
      .where('students.status = ? AND schools.id = ?', 0, school)
      .order(:id, :updated_at)
  }
  pg_search_scope :search_by_name, against: :name
end
