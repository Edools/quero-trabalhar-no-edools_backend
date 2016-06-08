class School < ActiveRecord::Base
  validates :name, :email , :pitch, :subdomain, presence: true
  has_many :courses
end
