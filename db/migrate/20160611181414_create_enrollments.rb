class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :student
      t.references :course
      t.boolean :active

      t.timestamps null: false
    end

    add_foreign_key :enrollments, :students
    add_foreign_key :enrollments, :courses
    add_index :enrollments, [:student_id, :course_id], unique: true
  end
end
