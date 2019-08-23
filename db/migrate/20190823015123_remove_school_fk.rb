class RemoveSchoolFk < ActiveRecord::Migration[5.2]
  def change
    remove_column :student_courses, :school
    remove_column :students, :school
    remove_column :courses, :school
  end
end
