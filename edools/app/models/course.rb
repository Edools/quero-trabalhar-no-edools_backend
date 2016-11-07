class Course < ApplicationRecord
  belongs_to :school
  has_many :enrolls, :dependent => :delete_all
end
