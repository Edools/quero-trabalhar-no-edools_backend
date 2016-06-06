module ApplicationHelper
  def students_per_school(school)
    count = school.courses.pluck(:active_students).inject(:+)

    count ? count : 0
  end
end
