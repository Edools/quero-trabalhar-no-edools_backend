class Course < ActiveRecord::Base
  belongs_to :school
  has_many :students

  validates :title, :description, :content, :duration, :price, :school_id
end
