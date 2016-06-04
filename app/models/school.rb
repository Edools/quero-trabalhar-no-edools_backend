class School < ActiveRecord::Base
  validates_presence_of :name, :owner_email, :pitch, :subdomain, :date_of_creation
end
