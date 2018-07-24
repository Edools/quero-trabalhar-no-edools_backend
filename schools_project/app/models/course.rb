class Course < ApplicationRecord
  belongs_to :user
  belongs_to :school

  validates :school, :title, presence: true

  monetize :price_cents
end
