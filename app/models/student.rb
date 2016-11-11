class Student < ActiveRecord::Base
  STATUSES = [:inactive, :active]
  STATUSES_IDS = STATUSES.each_with_index.map { |_, i| i }

  belongs_to :school
  has_many :student_courses

  validates :name,  presence: true
  validates :status, presence: true,
            numericality: true,
            inclusion: { in: STATUSES_IDS }
  validates :school_id, presence: true
end
