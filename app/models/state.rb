class State < ApplicationRecord
  belongs_to :country
  has_many :cities

  validates :name, :abbr, :country, presence: true

  def to_s
    "#{self.name}"
  end
end
