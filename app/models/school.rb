class School < ActiveRecord::Base
  has_many :courses

  validates_format_of :subdomain, with: /[\w-]+.edools.com/
end
