class School < ActiveRecord::Base

  # associations
  has_many :courses

  # validations
  validates :name,        presence: true
  validates :owner_email, presence: true
  validates :subdomain,   presence: true
end
