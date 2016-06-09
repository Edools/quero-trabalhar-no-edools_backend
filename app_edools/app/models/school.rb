class School < ActiveRecord::Base
  has_many :courses
  has_many :students

  validates_presence_of :name
  validates_presence_of :email_responsible
  validates_presence_of :pitch
  validates_uniqueness_of :name
  validates_uniqueness_of :email_responsible
  validates_uniqueness_of :subdomain
  validates_format_of :subdomain, with: /[A-z\d]*.[A-z\d]*\.edools.com/
  validates_format_of :email_responsible, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end
