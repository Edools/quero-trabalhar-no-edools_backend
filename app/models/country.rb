class Country < ApplicationRecord
  validates :name, :abbr, presence: true
end
