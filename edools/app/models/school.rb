class School < ApplicationRecord
	validates :name, presence: true
	validates :owner_email, presence: true
	validates :subdomain, presence: true

	has_many :courses, dependent: :destroy
end
