class Student < ApplicationRecord
  belongs_to :course

  validates :course, :name, presence: true
end
