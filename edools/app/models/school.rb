require_dependency '../validators/subdomain_validator.rb'

class School < ApplicationRecord


  validates :name, presence: true
  validates :owner_email, presence: true
  validates :subdomain, :presence => true,
                        :uniqueness => true,
                        :subdomain => true

  has_many :courses, dependent: :destroy
end
