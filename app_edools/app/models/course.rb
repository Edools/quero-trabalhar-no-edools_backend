class Course < ActiveRecord::Base
  belongs_to :school

  validates :title, :description, :content, :duration, :price, :school_id, presence: true
  validates_uniqueness_of :title, :description, :content
end
