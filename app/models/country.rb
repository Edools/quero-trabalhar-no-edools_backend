class Country < ApplicationRecord
  has_many :states
  validates :name, :abbr, presence: true

  def to_s
    "#{self.name}"
  end
end
