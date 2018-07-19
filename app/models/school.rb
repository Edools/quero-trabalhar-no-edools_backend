class School < ApplicationRecord
  has_many :courses, dependent: :destroy

  validates_presence_of :name, :owner_email, :pitch, :subdomain, :date_creation
  validates :owner_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :subdomain, format: { with: /\A([a-z][a-z\d]*(-[a-z\d]+)*|xn--[\-a-z\d]+)\z/i },
                        uniqueness: true
end
