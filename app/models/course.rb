class Course < ActiveRecord::Base
  include Searchable
  
  belongs_to :school

  validates_presence_of :title, :description, :content, :duration, :creation_date, :active_students, :price
  validates_associated :school
end
