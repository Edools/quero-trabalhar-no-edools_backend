class School < ActiveRecord::Base
  validates :name, :email_responsible, :pitch, presence: true
  validates_uniqueness_of :name, :email_responsible, :pitch, :subdomain
  validates_format_of :subdomain, with: /[A-z\d]*.[A-z\d]*\.edools.com/
  validates_format_of :email_responsible, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end
