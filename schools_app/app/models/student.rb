class Student < ActiveRecord::Base
  has_many :courses, through: :enrollments
  has_many :enrollments, dependent: :destroy

  validates :email, presence: true
  validates :name,  presence: true, length: { maximum: 60 }
end
