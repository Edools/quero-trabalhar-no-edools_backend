class Student < ActiveRecord::Base
  enum status: [ :active, :inactive ]
  has_and_belongs_to_many :courses
end
