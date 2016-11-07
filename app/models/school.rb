class School < ApplicationRecord
  has_many :courses

  validates :name, presence: true
  validates :owner_email, presence: true, email: true
  validates :subdomain, subdomain: true, uniqueness: true

  def to_s
    self.name
  end
end
