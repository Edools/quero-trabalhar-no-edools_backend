class School < ActiveRecord::Base
  EMAIL_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  before_save :generate_subdomain, if: 'self.name'
  has_many :courses

  validates_format_of :owner_email, with: EMAIL_REGEX
  validates_presence_of :name, :owner_email, :pitch
  validates_uniqueness_of :name, :owner_email
  validates_uniqueness_of :subdomain, on: [:create, :update]

  def generate_subdomain
    self.subdomain = name.parameterize
  end
end
