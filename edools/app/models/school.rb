class School < ApplicationRecord
  searchkick

  has_many :courses
  has_many :school_reports

  validates :name, :subdomain, presence: true
end
