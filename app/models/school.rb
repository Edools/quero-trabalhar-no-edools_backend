class School
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :owner_email, type: String
  field :pitch, type: String
  field :subdomain, type: String

  has_many :courses
end
