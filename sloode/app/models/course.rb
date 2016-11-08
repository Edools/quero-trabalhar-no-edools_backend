class Course < ActiveRecord::Base
  belongs_to :school

  # Validations
  validates :title, :school_id, :duration, presence: true
  validates :duration, numericality: { only_integer: true, allow_nil: true }
  validates :price, numericality: { allow_nil: true }
end
