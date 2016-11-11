class School < ActiveRecord::Base
  has_many :courses

  validates_format_of :subdomain, with: /[\w-]+.edools.com/

  def active_students
    courses = Course.where school_id: id
    count = 0
    courses.each do |course|
      count += course.active_students
    end
    count
  end
end
