class School < ApplicationRecord
  validates :name, presence: true
  validates :owner_email, presence: true, email: true
  validates :subdomain, subdomain: true, uniqueness: true
end
