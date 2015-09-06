class School
  include Mongoid::Document
  field :name, type: String
  field :owner_email, type: String
  field :pitch, type: String
  field :subdomain, type: String
end
