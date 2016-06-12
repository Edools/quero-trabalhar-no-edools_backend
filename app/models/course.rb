class Course < ActiveRecord::Base

  belongs_to :school

  validates :title, presence: true
  validates :school, presence: true
  validates :content, presence: true
  validates :duration, presence: true
  validates :price, presence: true

end
