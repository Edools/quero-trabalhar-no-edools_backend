class CourseStudent < ActiveRecord::Base
  #validates :name, presence: true
  belongs_to :course
  belongs_to :student
end
