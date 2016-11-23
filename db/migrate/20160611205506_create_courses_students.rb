class CreateCoursesStudents < ActiveRecord::Migration
  def change
    create_table :courses_students do |t|
      t.references :course, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
    end
  end
end
