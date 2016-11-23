class School < ActiveRecord::Base
  has_many :courses, dependent: :restrict_with_error
  has_many :students, through: :courses

  validates :name, presence: true
  validates :owner_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  validates :subdomain, presence: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  def to_s
    name
  end
end
