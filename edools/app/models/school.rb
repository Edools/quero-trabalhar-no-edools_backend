class School < ActiveRecord::Base
  has_many :students
  has_many :courses

  validates :name, presence: true, uniqueness: true
  #validates :owner_email gem install validates_email_format_of
  validates :pitch, presence: true
end
