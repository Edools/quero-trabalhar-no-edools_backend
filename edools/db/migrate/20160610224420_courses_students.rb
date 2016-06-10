class CoursesStudents < ActiveRecord::Migration
  def change
    create_table :course_students, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :student, index: true
    end
  end
end
