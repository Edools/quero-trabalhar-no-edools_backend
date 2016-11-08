class School < Base
  has_many :courses

  # Validations
  validates :name, :email, presence: true
  validates :subdomain, uniqueness: true
end
