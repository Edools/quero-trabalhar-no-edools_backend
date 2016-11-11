class Course < ActiveRecord::Base
  belongs_to :school
  has_many :student_courses

  validates :title, presence: true
  validates :school_id, presence: true
  validates :description, presence: true
  validates :content, presence: true
  validates :length, presence: true
  validates :price, presence: true, numericality: true

  def self.by_name query
    query ? where("name like ?", query) : all
  end
end
