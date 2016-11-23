class Course < ActiveRecord::Base
  belongs_to :school

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :content
  validates_presence_of :duration
  validates_presence_of :price
  validates_presence_of :school_id
end
