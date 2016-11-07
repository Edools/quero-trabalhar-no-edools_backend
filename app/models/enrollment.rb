class Enrollment < ApplicationRecord
  belongs_to :school
  belongs_to :student

  enum status: [:active, :processing, :locked, :canceled]

  validates :school, :student, :status, presence: true
end
