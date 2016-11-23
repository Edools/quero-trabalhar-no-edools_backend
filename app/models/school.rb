class School < ActiveRecord::Base

  # associations
  has_many :courses, dependent: :destroy

  # validations
  validates :name,        presence: true
  validates :owner_email, presence: true, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: true
  validates :subdomain,   presence: true, format: {with: /\A[^.-][a-zA-Z0-9.-]+[^.-]\.edools\.com\z/i}
end
