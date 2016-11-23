class Course < ActiveRecord::Base
  validates :title, :content, :duration, :price, presence: true
  belongs_to :school
  has_many :course_students
  has_many :students  ,through: :course_students

  private
  def self.search(search)
    if search
      where("title LIKE ?" , "%#{search}%")
    else
      all
    end
  end

end
