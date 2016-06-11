class AddNameToCourseStudents < ActiveRecord::Migration
  def change
    add_column :course_students, :name, :string
  end
end
