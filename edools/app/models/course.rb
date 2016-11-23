class Course < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :students

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :content, presence: true
  validates :duration, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0}
end
