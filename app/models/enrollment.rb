# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  student_id :integer
#  course_id  :integer
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_enrollments_on_student_id_and_course_id  (student_id,course_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_2e119501f4  (course_id => courses.id)
#  fk_rails_f01c555e06  (student_id => students.id)
#

class Enrollment < ActiveRecord::Base
  validates :student, :course, presence: true
  belongs_to :course, counter_cache: :total_active_students
  belongs_to :student
end
