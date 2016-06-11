class Course < ActiveRecord::Base
  belongs_to :school

  scope :with_schools, -> (school) { joins(:school).where(school: school) }
end
