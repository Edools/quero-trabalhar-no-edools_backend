class DropCourseStudents < ActiveRecord::Migration
  def change
    drop_table :course_students
  end
end
