class School < ApplicationRecord
  searchkick

  has_many :courses
  validates :name, :subdomain, presence: true
end
