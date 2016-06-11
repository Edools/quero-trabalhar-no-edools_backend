class Course < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :students

  scope :with_schools, -> (school) { where(school: school) }
end
