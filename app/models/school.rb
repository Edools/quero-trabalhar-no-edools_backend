class School < ApplicationRecord

  has_many :courses

  validates_presence_of :name, :owner_email, :subdomain, :creation_date
  validates_uniqueness_of :subdomain
  validates_format_of :subdomain, with: /\A\S*\Z/
end