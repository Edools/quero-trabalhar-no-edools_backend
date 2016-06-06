class School < ActiveRecord::Base
  include Searchable
  
  has_many :courses
  validates_presence_of :name, :owner_email, :pitch, :subdomain, :date_of_creation
  validates_format_of :subdomain, with: /\A^[-a-z]+$\z/

  def active_students
    self.courses.pluck(:active_students).sum if self.courses.any?
  end

end
