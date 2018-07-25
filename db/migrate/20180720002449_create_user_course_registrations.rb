class CreateUserCourseRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_course_registrations do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
