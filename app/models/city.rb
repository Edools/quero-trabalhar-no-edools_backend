class City < ApplicationRecord
  belongs_to :state

  validates :name, :state, presence: true
end
