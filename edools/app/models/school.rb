require_dependency '../validators/subdomain_validator.rb'

class School < ApplicationRecord
  has_many :courses, :dependent => :delete_all
  
  validates :name, :presence => true
  validates :owner_email, :presence => true, :uniqueness => true
  validates :subdomain, :presence => true,
                        :uniqueness => true,
                        :subdomain => true
    validates_format_of :owner_email, :with => /\A\S+@.+\.\S+\z/
end
