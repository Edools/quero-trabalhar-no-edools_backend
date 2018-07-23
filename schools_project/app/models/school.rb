class School < ApplicationRecord
  belongs_to :user

  validates :name, :pitch, :subdomain, presence: true
end
