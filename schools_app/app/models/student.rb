class Student < ActiveRecord::Base
  validates :email, presence: true
  validates :name,  presence: true, length: { maximum: 60 }
end
