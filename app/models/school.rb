class School < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :courses

  validates_presence_of :name, :owner_email, :subdomain, :creation_date
  validates_uniqueness_of :subdomain
  validates_format_of :subdomain, with: /\A\S*\Z/
  validates_format_of :owner_email, with: EMAIL_REGEX

  scope :by_name, ->(name) { where('name like ?', "%#{name}%") }
end
