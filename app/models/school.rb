class School < ApplicationRecord
  validates_presence_of   :name, :owner_email, :subdomain
  validates_uniqueness_of :name, :subdomain
  validates_format_of     :subdomain, with: /\A[^.-][a-zA-Z0-9.-]+[^.-]\.edools\.com\z/i

  has_many :courses

  before_validation :set_subdomain

  private
    def set_subdomain
      self.subdomain = "#{self.subdomain}.edools.com"
    end
end
