class AddCourseIdToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :course, index: true, foreign_key: true
  end
end
