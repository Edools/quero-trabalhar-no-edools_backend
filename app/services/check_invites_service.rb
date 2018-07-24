class CheckInvitesService

  def initialize(user, course)
    @user = user
    @course = course
  end

  def call
    if UserCourseRegistration.exists?(user_id: @user, course_id: @course)
      false
    else
      UserCourseRegistration.create(user_id: @user, course_id: @course, school_id: find_school)
    end
  end

  private

  def find_school
    school = Course.find(@course).school.id
  end
end