class Student < ActiveRecord::Base
  has_many :courses
  belongs_to :school

  validates :name, :address, :document, :phone, :responsible, :registration,
            :status, :course_id, presence: true
end
