class Course < ApplicationRecord
  belongs_to :school, optional: false

  validates_presence_of :title, :description, :content, :price, :start_date, :end_date
  validate :course_duration

  def course_duration
    errors.add(:start_date, "can't be bigger than end_date") if start_date > end_date
  end
end
