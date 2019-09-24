class CoursePolicy
  attr_reader :admin, :course

  def initialize(user, course)
    @admin = admin
    @course = course
  end

  def destroy?
    @admin && @course.active_students.present?
  end
end