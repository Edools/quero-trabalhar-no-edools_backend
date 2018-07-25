class UserCourseRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :school
end
