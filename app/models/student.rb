class Student < ApplicationRecord

  belongs_to :course

  validates_presence_of :name, :course_id
end
