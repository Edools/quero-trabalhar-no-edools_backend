class Course < ApplicationRecord
  belongs_to :school

  validates :title, presence: true
end
