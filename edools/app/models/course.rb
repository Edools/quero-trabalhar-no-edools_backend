class Course < ActiveRecord::Base
  validates :title, :content, :duration, :price, :active_students, presence: true
  belongs_to :school
end
