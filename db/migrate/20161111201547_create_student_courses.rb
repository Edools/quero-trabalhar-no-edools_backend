class CreateStudentCourses < ActiveRecord::Migration
  def change
    create_table :student_courses do |t|
      t.integer :course_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
