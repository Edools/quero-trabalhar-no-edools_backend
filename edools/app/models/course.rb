class Course < ApplicationRecord
  belongs_to :school
  has_many :enrolls, :dependent => :delete_all
  validates :title, :presence => true
end
