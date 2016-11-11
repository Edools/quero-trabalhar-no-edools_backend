class School < ActiveRecord::Base
  has_many :courses, dependent: :destroy

  scope :search_name, -> (search) { where('name ILIKE ?', "%#{search}%") }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_SUBDOMAIN_REGEX = /\A[a-z\d]+([-_][a-z\d]+)*\.edools.com\z/i

  validates :name,        presence: true, length: { maximum: 60 }
  validates :owner_email, presence: true, length: { maximum: 255 },
                          format: { with: VALID_EMAIL_REGEX }
  validates :subdomain,   format: { with: VALID_SUBDOMAIN_REGEX }
end
