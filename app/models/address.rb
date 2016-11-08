class Address < ApplicationRecord
  belongs_to :city

  validates :street, :city, presence: true

  def to_s
    "#{self.street}, #{self.number}, #{self.district}. #{self.city.state} - #{self.city.state.country}"
  end
end
