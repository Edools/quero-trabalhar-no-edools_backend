class Course < ActiveRecord::Base

  # associations
  belongs_to :school

  # validations
  validates :title,           presence: true
  validates :duration,        presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :active_students, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price,           presence: true, numericality: { greater_than: 0 }
  validates :school,          presence: true

  usar_como_dinheiro :price
end
