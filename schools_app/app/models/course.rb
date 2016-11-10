class Course < ActiveRecord::Base
  belongs_to :school

  validates :content, :description, :school, :title, presence: true
end
