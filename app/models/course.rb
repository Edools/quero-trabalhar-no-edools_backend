class Course < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_title, 
                  :against => :title, 
                  :using => {
                    :tsearch => {:prefix => true}
                  }

  belongs_to :school
  belongs_to :user

  has_many :user_course_registrations, dependent: :destroy
  has_many :users, through: :user_course_registrations

  validates_presence_of :title, :duration, :price
  validates_numericality_of :price, :greater_than_or_equal_to => 0

  
end
