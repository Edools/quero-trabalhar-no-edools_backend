class Student < ApplicationRecord
  has_many :enrolls
  validates :name, :presence => true
  validates :email, :uniqueness => true,
                    :presence => true
  validates_format_of :email, :with => /\A\S+@.+\.\S+\z/
end
