class Course < ApplicationRecord
  belongs_to :school
  belongs_to :user

  validates_presence_of :title, :duration, :price, :active_student
  validates_numericality_of :price, :greater_than_or_equal_to => 0
  validates_numericality_of :active_student, :greater_than_or_equal_to => 0, 
                            :only_integer => true
end
