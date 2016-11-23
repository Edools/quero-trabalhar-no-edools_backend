class School < ActiveRecord::Base
  has_many :students
  has_many :courses

  validates :name, presence: true, uniqueness: true
  validates_email_format_of :owner_email
  validates_presence_of :pitch
  validates :subdomain, format: { with: /\A[a-zA-Z0-9-]+.edools.com\z/ }
end
