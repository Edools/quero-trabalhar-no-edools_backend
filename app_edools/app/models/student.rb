class Student < ActiveRecord::Base
  belongs_to :school

  validates_presence_of :name
  validates_presence_of :phone
  validates_presence_of :document
  validates_presence_of :address
end
