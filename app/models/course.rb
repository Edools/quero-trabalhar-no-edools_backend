class Course < ActiveRecord::Base

  # associations
  belongs_to :school

  # validations
  validates :title,           presence: true
  validates :duration,        presence: true
  validates :active_students, presence: true
  validates :price,           presence: true
  validates :school,          presence: true
end
