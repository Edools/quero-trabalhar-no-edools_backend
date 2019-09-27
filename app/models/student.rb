class Student < ApplicationRecord

  belongs_to :course

  scope :active_by_school_id, ->(school_id) {
    joins(course: :school).where(active: true, courses: { schools: {id: school_id }})
  }

  scope :acive_by_course_id, ->(course_id) {
    joins(course: :school).where(active: true, courses: { id: course_id })
  }

  validates_presence_of :name, :course_id
end
