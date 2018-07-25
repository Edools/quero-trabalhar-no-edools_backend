class CoursesFacade

  def initialize(params = nil)
    @params = params
  end

  def show_course
    Course.find(@params)
  end

  def count_students
    show_course.user_course_registrations.count
  end
end