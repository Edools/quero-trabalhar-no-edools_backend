class School < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name, 
                  :against => :name, 
                  :using => {
                    :tsearch => {:prefix => true}
                  }

  has_many :courses, dependent: :destroy
  belongs_to :user
  has_many :user_course_registrations, dependent: :destroy

  validates_presence_of :name, :owner_email, :pitch, :subdomain, :date_creation
  validates :owner_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :subdomain, format: { with: /\A([a-z][a-z\d]*(-[a-z\d]+)*|xn--[\-a-z\d]+)\z/i,
                                  message: "Domain is invalid"  },
                        uniqueness: true
end
