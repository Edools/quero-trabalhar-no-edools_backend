class Course < ActiveRecord::Base
  include PgSearch

  belongs_to :school
  has_and_belongs_to_many :students

  scope :with_schools, -> (school) { where(school: school) }
  pg_search_scope :search_by_name, against: :title
end
