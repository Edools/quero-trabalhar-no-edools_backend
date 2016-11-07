class Address < ApplicationRecord
  belongs_to :city

  validates :street, :city, presence: true
end
