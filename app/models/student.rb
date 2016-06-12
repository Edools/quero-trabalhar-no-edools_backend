class Student < ActiveRecord::Base
  belongs_to :course
  has_one :school, through: :course

  validates :name, presence: true
  validates :course, presence: true
  validates :matricula, presence: true
end
