class Student < ActiveRecord::Base
  enum status: [ :active, :inactive ]
end
