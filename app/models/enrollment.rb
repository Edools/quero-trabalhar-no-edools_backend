class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student

  enum status: [:active, :processing, :locked, :canceled]

  validates :course, :student, :status, presence: true
end
