class School < ApplicationRecord
  has_many :courses

  validates :name, :subdomain, presence: true
end
