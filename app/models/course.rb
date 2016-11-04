class Course < ApplicationRecord
  validates_presence_of :title, :description, :content, :duration, :amount

  belongs_to :school
end
