class School < ApplicationRecord
  VALID_SUBDOMAIN_REGEX = /\A([a-z][a-z\d]*(-[a-z\d]+)*|xn--[\-a-z\d]+)\z/i

  belongs_to :user

  has_many :courses, dependent: :destroy

  validates :name, :pitch, :subdomain, presence: true
  validates :subdomain, uniqueness: true
  validates :subdomain, format: { with: VALID_SUBDOMAIN_REGEX }
end
