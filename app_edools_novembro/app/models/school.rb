class School < ActiveRecord::Base
  has_many :courses, dependent: :destroy
  has_many :students, dependent: :destroy

  validates :name, :email, :pitch, :subdomain, presence: true
  validates_format_of :subdomain, with: /[A-z\d]*.[A-z\d]*\.edools.com/
end
