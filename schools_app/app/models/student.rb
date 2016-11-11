class Student < ActiveRecord::Base
  has_many :courses, through: :enrollments
  has_many :enrollments, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :name,  presence: true, length: { maximum: 60 }
end
