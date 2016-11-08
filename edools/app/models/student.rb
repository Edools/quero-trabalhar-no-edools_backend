class Student < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :courses

  validates :name, presence: true, uniqueness: true
end
