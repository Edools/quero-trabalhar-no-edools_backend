class Course < ActiveRecord::Base
  belongs_to :school, counter_cache: true
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  validates :content,     presence: true
  validates :description, presence: true
  validates :school,      presence: true
  validates :title,       presence: true
end
