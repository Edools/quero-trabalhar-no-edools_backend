class Student < ActiveRecord::Base
  has_many :courses
  belongs_to :school
end
