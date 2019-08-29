class Course < ApplicationRecord
  searchkick

  belongs_to :school
  validates :title, presence: true
end
