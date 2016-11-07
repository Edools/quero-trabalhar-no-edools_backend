class State < ApplicationRecord
  belongs_to :country

  validates :name, :abbr, :country, presence: true
end
