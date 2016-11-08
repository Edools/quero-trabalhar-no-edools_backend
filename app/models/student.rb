class Student < ApplicationRecord
  belongs_to :address

  has_many :enrollments
  has_many :courses, through: :students

  validates :email, presence: true, email: true
  validates :name, :birthdate, presence: true

  accepts_nested_attributes_for :address

  def to_s
    self.name
  end
end
