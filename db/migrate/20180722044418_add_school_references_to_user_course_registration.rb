class AddSchoolReferencesToUserCourseRegistration < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_course_registrations, :school, foreign_key: true
  end
end
