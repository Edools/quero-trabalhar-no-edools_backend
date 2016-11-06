class School < ActiveRecord::Base
  has_many :courses
  has_many :students

  validates :name, :email, :pitch, :subdomain, presence: true
  validates_format_of :subdomain, with: /[A-z\d]*.[A-z\d]*\.edools.com/
end
