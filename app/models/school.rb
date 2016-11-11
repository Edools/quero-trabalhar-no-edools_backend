class School < ActiveRecord::Base
  has_many :courses

  validates :name, presence: true
  validates :owner_email, presence: true
  validates :pitch, presence: true
  validates :subdomain, presence: true, uniqueness: true,
            format: { with: /([a-z0-9]+[.])*edools[.]com/ }
end
