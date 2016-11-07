class City < ApplicationRecord
  belongs_to :state

  validates :email, :state, presence: true
end
