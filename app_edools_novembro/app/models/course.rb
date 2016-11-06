class Course < ActiveRecord::Base
  belongs_to :school, dependent: :destroy
  has_many :students

  validates :title, :description, :content, :duration, :price, :school_id, presence: true
end
